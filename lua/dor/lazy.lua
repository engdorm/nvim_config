-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

-- return require('packer').startup(function(use)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "
local plugins = {
    -- Packer can manage itself

    -- Simple plugins can be specified as strings
    'rstacruz/vim-closer',
    { 'm00qek/baleia.nvim', version = 'v1.3.0', },
    'github/copilot.vim',
    -- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
    {
        'numToStr/Comment.nvim',
        opts = {
            toggler = {
                line_comment = "gcc",
                block_comment = "gbc",
            },
            opleader = {
                line_comment = "gc",
                block_comment = "gb",
            },
        },
        -- add any options here
        lazy = false,
    },

    -- Lazy loading:
    -- Load on specific commands
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 0
        end,
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },
    {
        'andymass/vim-matchup',
        init = function()
            -- may set any options here
            vim.g.matchup_matchparen_offscreen = { method = "popup" }
        end
    },



    -- Load on a combination of conditions: specific filetypes or commands
    -- Also build code after load (see the "config" key)
    -- use {
    --   'w0rp/ale',
    --   ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
    --   cmd = 'ALEEnable'o,u
    --   config = 'vim.cmd[[ALEEnable]]'
    -- }
    --
    -- -- Plugins can have dependencies on other plugins
    -- use {
    --   'haorenW1025/completion-nvim',
    --   lazy = true,
    --   dependencies = {{'hrsh7th/vim-vsnip', lazy = true}, {'hrsh7th/vim-vsnip-integ', lazy = true}}
    -- }
    -- {
    --     "ray-x/lsp_signature.nvim",
    --     event = "VeryLazy",
    --     config = function()
    --         require("lsp_signature").setup()
    --     end,
    -- },

    {
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },
    'tjdevries/apyrori.nvim',

    -- Plugins can have post-install/update hooks
    { 'iamcco/markdown-preview.nvim', build = 'cd app && yarn install', cmd = 'MarkdownPreview' },
    { 'alexghergh/nvim-tmux-navigation', config = function()
        require 'nvim-tmux-navigation'.setup {
            disable_when_zoomed = true, -- defaults to false
            keybindings = {
                left = "<C-h>",
                down = "<C-j>",
                up = "<C-k>",
                right = "<C-l>",
                last_active = "<C-\\>",
                -- next = "<C-Space>",
            }
        }
    end
    },

    -- Post-install/update hook with neovim command
    { 'nvim-treesitter/nvim-treesitter',
        dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
        build = ':TSUpdate',
    },

    -- Post-install/update hook with call of vimscript function with argument
    { 'glacambre/firenvim', build = function() vim.fn['firenvim#install'](0) end },

    { 'theprimeagen/harpoon', branch = "harpoon2", dependencies = { { "nvim-lua/plenary.nvim" } } },
    { 'mbbill/undotree' },
    { 'tpope/vim-fugitive' },
    { 'folke/neodev.nvim', opts = {} },
    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            'folke/neodev.nvim',

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    },

    {
        'rose-pine/neovim',
        name = 'rose-pine',
        -- config = function()
        --     vim.cmd('colorscheme rose-pine')
        -- end
    },
    {
        "folke/tokyonight.nvim",
        name = "tokyonight",
        lazy = false,
        priority = 1000,
        opts = {
            transparent = true,
            styles = {
                comments = "italic",
                functions = "italic",
                keywords = "italic",
                strings = "italic",
                variables = "italic",
                sidebars = "transparent",
                floats = "transparent",

            },
        },
        config = function()
            vim.cmd('colorscheme tokyonight-night')
        end
    },
    -- Use dependency and build lua function after load
    {
        'lewis6991/gitsigns.nvim', dependencies = { 'nvim-lua/plenary.nvim' },
        config = function() require('gitsigns').setup() end
    },
    -- {
    --     "jose-elias-alvarez/null-ls.nvim",
    --     config = function()
    --         require("null-ls").setup()
    --     end,
    --     dependencies = { "nvim-lua/plenary.nvim" },
    -- },
    {
        'stevearc/aerial.nvim',
        config = function() require('aerial').setup() end
    },
    -- You can specify multiple plugins in a single call
    { 'tjdevries/colorbuddy.vim', dependencies = { 'nvim-treesitter/nvim-treesitter' } },

    -- "terrortylor/nvim-comment",
    "eandrju/cellular-automaton.nvim",
    "is0n/jaq-nvim",
    { "nvim-neotest/nvim-nio",  event = "VeryLazy",},
    -- Debugs stuff:
    'mfussenegger/nvim-dap',
    'mfussenegger/nvim-dap-python',
    { "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotes/nvim-nio" },
        event = "VeryLazy",
        -- lazy = true,
    },
    'theHamsta/nvim-dap-virtual-text',
    'nvim-telescope/telescope-dap.nvim',
    -- Colorschemes
    'nvim-tree/nvim-web-devicons',
    "EdenEast/nightfox.nvim",
    { 'dracula/vim', name = 'dracula' },
    'mortepau/codicons.nvim',

    -- DBs:
    'tpope/vim-dadbod',
    'kristijanhusak/vim-dadbod-ui',
    'kristijanhusak/vim-dadbod-completion',
    -- use 'kristijanhusak/vim-dadbod-explorer'
    -- Tmux
    {
        'numToStr/Navigator.nvim',
        config = function()
            require('Navigator').setup()
        end
    },


    -- use {
    --     'pwntester/octo.nvim',
    --     dependencies = {
    --         'nvim-lua/plenary.nvim',
    --         'nvim-telescope/telescope.nvim',
    --         'kyazdani42/nvim-web-devicons',
    --     },
    --     config = function()
    --         require "octo".init()
    --     end
    -- }
    -- use{'stevearc/gkeep.nvim', build = ':UpdateRemotePlugins'}
    {
        -- Set lualine as statusline
        'nvim-lualine/lualine.nvim',
        -- See `:help lualine.txt`
        opts = {
            options = {
                icons_enabled = false,
                theme = 'onedark',
                component_separators = '|',
                section_separators = '',
            },
        },
    },


    {
        'ldelossa/gh.nvim',
        dependencies = { { 'ldelossa/litee.nvim' } }
    },
    -- lazy.nvim
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        }
    },
    -- You can alias plugin names
    { 'epwalsh/obsidian.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
}
local opts = {}

require("lazy").setup(plugins, opts)
