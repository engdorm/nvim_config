local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        -- null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.diagnostics.flake8.with {filetypes = { "python"}},
        null_ls.builtins.diagnostics.pylint.with {filetypes = { "python"}},
        null_ls.builtins.diagnostics.pycodestyle.with {filetypes = { "python"}, extra_args = { '--max-line-length=100', '--ignore=E501'}},
        null_ls.builtins.completion.spell,
        null_ls.builtins.formatting.black.with {filetypes = { "python" }, extra_args = { '--line-width=100' }},
        null_ls.builtins.code_actions.gitsigns,
    },
})
