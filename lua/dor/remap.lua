vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Vex, {desc = "Vex"})
vim.keymap.set("n", "<leader>pe", vim.cmd.Lex, {desc = "Ex"})
vim.keymap.set("n", "<leader>pl", vim.cmd.Lex, {desc = "Lex"})
vim.keymap.set("n", "<leader>pt", vim.cmd.difft, {desc = "diff this"})

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "zq", "<cmd>bd<CR>", {desc = "Close buffer"})
vim.keymap.set("n", "<leader><C-f>", vim.lsp.buf.format, {desc = "Format"})

-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<leader>J", "<cmd>cprev<CR>zz", {desc = "Prev quickfix"})
vim.keymap.set("n", "<leader>K", "<cmd>cnext<CR>zz", {desc = "Next quickfix"})
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", {desc = "Prev local fix"})
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", {desc = "Next local fix"})
vim.keymap.set("n", "<leader>t", "<cmd> vsplit term://bash<CR>", {desc = "Terminal"})

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {desc = "Substitute"})
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })


vim.keymap.set("n", "<C-h>", "<C-W>h")
vim.keymap.set('t', '<C-h>', '<C-\\><C-N><C-w>h')
vim.keymap.set('t', '<C-j>', '<C-\\><C-N><C-w>j')
vim.keymap.set('t', '<C-k>', '<C-\\><C-N><C-w>k')
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
vim.keymap.set('t', '<C-l>', '<C-\\><C-N><C-w>l')
vim.keymap.set('i', '<C-h>', '<C-\\><C-N><C-w>h')
vim.keymap.set('i', '<C-j>', '<C-\\><C-N><C-w>j')
vim.keymap.set('i', '<C-k>', '<C-\\><C-N><C-w>k')
vim.keymap.set('i', '<C-l>', '<C-\\><C-N><C-w>l')
vim.keymap.set("n", "<C-j>", "<C-W>j")
vim.keymap.set("n", "<C-k>", "<C-W>k")
vim.keymap.set("n", "<C-l>", "<C-W>l")
