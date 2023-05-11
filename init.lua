-- Install packer
require("dor")
vim.cmd([[
cmap w!! w !sudo tee > /dev/null %
command! Jsonf :%!python -m json.tool
]])
-- todo: add danymat for create docsting
-- add black pylint and flack8 support
-- need to review my lunarvim config in maui slack
-- also check how to see function params like pycharm
-- and jupyter support 
-- and debuger
-- set also terminal in split screen, see lunar vim plugin
-- install rainbow plugin 
-- and maybe tabline airline and 
--command! Jsonf :%!python -m json.tool
-- lightline 
-- cmap w!! w !sudo tee > /dev/null %
