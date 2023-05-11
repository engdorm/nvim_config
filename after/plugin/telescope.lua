local builtin = require('telescope.builtin')
dirs = {spawner="/home/dor/ws/flow-initiator/flow_initiator",
         shared="/home/dor/ws/movai-core-shared/movai_core_shared/",
         enterprise= "/home/dor/ws/movai-core-enterprise/movai_core_enterprise/",
         gd="/home/dor/ws/gd-node/gd_node/",
         backend="/home/dor/ws/backend/backend/",
         dal="/home/dor/ws/data-access-layer/dal/"}
vim.keymap.set('n', '<leader>pf', function()
    builtin.find_files( { search_dirs = dirs})
end)
vim.keymap.set('n', '<leader>pm', function()
    builtin.grep_string( { cwd="/home/dor/ws/" , grep_open_files=false, search_dirs=dirs,
                            search= vim.fn.input("Movai grep > ") })
end)
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>pg', function ()
    builtin.live_grep( {search_dirs = {spawner="/home/dor/ws/flow-initiator/flow_initiator"}})
end)
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fs', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
ws="/home/dor/ws/"
vim.keymap.set('n', '<leader>fm', function()
    builtin.grep_string({search_dirs = dirs })-- vim.fn.input("Grep Movai> ")});
end)
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
port = 1

vim.keymap.set('n', '<leader>fj', require('telescope.builtin').jumplist, { desc = '[j] Find jumps' })
vim.keymap.set('n', '<leader>?', require('telescope.builtin').keymaps, { desc = '[?] Find keymaps ' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').oldfiles, { desc = '[space] Find recently opened files' })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {desc = '[C]ode [A]ction' })
