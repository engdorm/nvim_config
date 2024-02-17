-- a plugin to colorize hex colors in lua for terminal output
vim.cmd([[
let s:baleia = luaeval("require('baleia').setup { }")
command! BaleiaColorize call s:baleia.once(bufnr('%'))
nnoremap <leader>co :BaleiaColorize<CR>
]])

local wk = require("which-key")
wk.register({
    c = {
        name = "colr/comment/caction",
        o = {
            name = "color output from the terminal",
        }
    }
})
