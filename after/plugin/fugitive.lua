vim.keymap.set("n", "<leader>gs", vim.cmd.Git, {desc = "Git Status"})
vim.keymap.set("n", "<leader>gb", vim.cmd.GitBlameToggle, {desc = "Git Blame"})
vim.keymap.set("n", "<leader>gp", vim.cmd.GitPull, {desc = "Git Pull"})


local ThePrimeagen_Fugitive = vim.api.nvim_create_augroup("ThePrimeagen_Fugitive", {})

local autocmd = vim.api.nvim_create_autocmd


