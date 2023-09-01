require("mason").setup()
require("mason-lspconfig").setup()
require"lspconfig".marksman.setup{}

local lsp = require("lsp-zero").preset({})

lsp.preset("recommended")

lsp.ensure_installed({
	'eslint',
	'lua_ls',
})

-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' }
			}
		}
	}
})


local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-y>'] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})

-- disable completion with tab
-- this helps with copilot setup
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil


lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

lsp.set_preferences({
	suggest_lsp_servers = false,
	sign_icons = {
		error = 'E',
		warn = 'W',
		hint = 'H',
		info = 'I'
	}
})

lsp.on_attach(function(client, bufnr)
	local opts = {buffer = bufnr, remap = false}

	-- if client.name == "eslint" then
	-- 	vim.cmd.LspStop('eslint')
	--         return
	--     end

    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, remap = false, desc = desc })
    end
    nmap("<leader>vws", vim.lsp.buf.workspace_symbol, '[V]iew [W]orkspace [S]ymbols')
    nmap("[d", vim.diagnostic.goto_next, ' [ [D]iagnostic Next')
    nmap("]d", vim.diagnostic.goto_prev, '] [D]iagnostic Prev')
    nmap("<leader>vca", vim.lsp.buf.code_action, '[V]iew [C]ode [A]ction')
    nmap("<leader>vrr", vim.lsp.buf.references, '[V]iew [R]eferences')
    nmap("<leader>vrn", vim.lsp.buf.rename, '[V]iew [R]ename')
    nmap("<leader>vd", vim.diagnostic.open_float, '[V]iew [D]iagnostics')

    nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

    nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
    nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
    nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

    -- See `:help K` for why this keymap
    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    nmap('<M-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

    -- Lesser used LSP functionality
    nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    nmap('<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, '[W]orkspace [L]ist Folders')

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        if vim.lsp.buf.format then
            vim.lsp.buf.format()
        elseif vim.lsp.buf.formatting then
            vim.lsp.buf.formatting()
        end
    end, { desc = 'Format current buffer with LSP' })
end)

lsp.setup()

vim.diagnostic.config({
	virtual_text = true,
})

local wk = require("which-key")
wk.register({
  ["<leader>f"] = {name = "find"},
  ["<leader>c"] = {name = "comment/code_action"},
  ["<leader>p"] = {name = "project"}
})

