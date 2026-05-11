return {
    settings = { fixKind = 'all' },
    on_attach = function(client, bufnr)
        vim.api.nvim_buf_create_user_command(
            bufnr,
            'LspOxlintFixAll',
            function()
                client:exec_cmd {
                    title = 'Apply Oxlint automatic fixes',
                    command = 'oxc.fixAll',
                    arguments = { { uri = vim.uri_from_bufnr(bufnr) } },
                }
            end,
            { desc = 'Apply Oxlint automatic fixes' }
        )
    end,
}
