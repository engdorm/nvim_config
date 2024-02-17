local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>aa", function() harpoon:list():append() end, { desc="Add current file to harpoon" })
vim.keymap.set("n", "<leader>am", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc="Open harpoon menu" })

vim.keymap.set("n", "<leader>aq", function() harpoon:list():select(1) end, { desc="harpooon Select 1" })
vim.keymap.set("n", "<leader>aw", function() harpoon:list():select(2) end, { desc="harpooon Select 2" })
vim.keymap.set("n", "<leader>ae", function() harpoon:list():select(3) end, { desc="harpooon Select 3" })
vim.keymap.set("n", "<leader>an", "<cmd>bnext<CR>", { desc="Next buffer" })
vim.keymap.set("n", "<leader>ap", "<cmd>bprev<CR>", { desc="Prev buffer" })
