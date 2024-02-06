-- Install packer
require("dor")
vim.cmd([[
cmap w!! w !sudo -S tee > /dev/null % < ~/pass
command! Jsonf :%!python -m json.tool
]])
-- todo: add danymat for create docsting
-- and jupyter support 
-- install rainbow plugin 
-- lightline 
