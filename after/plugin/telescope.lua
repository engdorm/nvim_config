local builtin = require('telescope.builtin')
dirs = {spawner="/home/dor/ws/flow-initiator/flow_initiator",
         shared="/home/dor/ws/movai-core-shared/movai_core_shared/",
         enterprise= "/home/dor/ws/movai-core-enterprise/movai_core_enterprise/",
         gd="/home/dor/ws/gd-node/gd_node/",
         backend="/home/dor/ws/backend/backend/",
         dal="/home/dor/ws/data-access-layer/dal/"}
vim.keymap.set('n', '<leader>pf', function()
    builtin.find_files( { search_dirs = dirs})
end, { desc = '[f] Find files' })
vim.keymap.set('n', '<leader>pm', function()
    builtin.grep_string( { cwd="/home/dor/ws/" , grep_open_files=false, search_dirs=dirs,
                            search= vim.fn.input("Movai grep > ") })
end)
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[f] Find files' })
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>pg', function ()
    builtin.live_grep( {search_dirs = dirs})
end)
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[g] live_grep in files' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[h] Find help tags' })
vim.keymap.set('n', '<leader>fs', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end, { desc = '[s] Grep string' })
ws="/home/dor/ws/"
vim.keymap.set('n', '<leader>fm', function()
    builtin.grep_string({search_dirs = dirs,   vim.fn.input("Grep Movai> ")});
end, { desc = '[m] Movai grep' })
port = 1

vim.keymap.set('n', '<leader>ft', require('telescope.builtin').treesitter, { desc = '[t] Find treesitter' })
vim.keymap.set('n', '<leader>fc', require('telescope.builtin').commands, { desc = '[c] Find commands' })
vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = '[d] Find diagnostics' })
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').lsp_document_symbols, { desc = '[b] Find buffer symbols' })
vim.keymap.set('n', '<leader>fk', require('telescope.builtin').keymaps, { desc = '[k] Find keymaps' })
vim.keymap.set('n', '<leader>fp', require('telescope.builtin').spell_suggest, { desc = '[P] Find sPell_suggest' })
vim.keymap.set('n', '<leader>fo', require('telescope.builtin').oldfiles, { desc = '[o] Find oldfiles' })
vim.keymap.set('n', '<leader>fj', require('telescope.builtin').jumplist, { desc = '[j] Find jumps' })
vim.keymap.set('n', '<leader>?', require('telescope.builtin').keymaps, { desc = '[?] Find keymaps ' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[space] Find buffers' })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {desc = '[C]ode [A]ction' })
