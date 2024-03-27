require('rose-pine').setup({
    disable_background = true,
    styles = {
        comments = "italic",
        transparency = true,
    },
    options = {
        groups = {
            all = {
              GitSignsAddNr = { fg = "#26A07A" },
              GitSignsDeleteNr = { fg = "#E87D7D" },
              GitSignsChangeNr = { fg = "#AD991F" },
          },
      },
    },
    highlight_groups = {
        VertSplit = { fg = "muted", bg = "none" },
    }
})

function ColorMyPencils(color) 
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

ColorMyPencils()
