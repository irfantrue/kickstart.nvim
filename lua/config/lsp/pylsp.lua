-- Python LSP Server (pylsp) configuration
return {
    settings = {
        pylsp = {
            plugins = {
                -- Disable plugins that may conflict or cause issues
                pylint = { enabled = false },
                pydocstyle = { enabled = false },
                pycodestyle = { enabled = false },
                autopep8 = { enabled = false },
                yapf = { enabled = false },
                flake8 = { enabled = false },
                -- Enable useful plugins
                jedi_completion = { enabled = true },
                jedi_definition = { enabled = true },
                jedi_hover = { enabled = true },
                jedi_references = { enabled = true },
                jedi_signature_help = { enabled = true },
                jedi_symbols = { enabled = true },
                mccabe = { enabled = true, threshold = 15 },
                preload = { enabled = true },
                rope_completion = { enabled = true },
            },
        },
    },
}
