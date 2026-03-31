-- Nomic Foundation Solidity Language Server configuration
return {
    cmd = { 'nomicfoundation-solidity-language-server', '--stdio' },
    filetypes = { 'solidity' },
    root_dir = require('lspconfig.util').root_pattern '.git', -- Search for .git to find project root
    single_file_support = true, -- Enable LSP features for standalone files
    settings = {
        solidity = {
            validateOnSave = true, -- Run linter on file save
        },
    },
}
