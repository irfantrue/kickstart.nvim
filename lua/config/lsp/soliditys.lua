return {
    cmd = { 'nomicfoundation-solidity-language-server', '--stdio' },
    filetypes = { 'solidity' },
    root_dir = require('lspconfig.util').root_pattern '.git',
    single_file_support = true,
    settings = {
        solidity = {
            validateOnSave = true,
        },
    },
}
