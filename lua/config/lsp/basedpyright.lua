-- BasedPyright LSP configuration
-- Fork dari Pyright tanpa telemetry, dengan fitur lebih lengkap
return {
    settings = {
        basedpyright = {
            analysis = {
                -- Type checking mode: 'off' | 'basic' | 'standard' | 'strict' | 'recommended'
                typeCheckingMode = 'standard',

                -- Auto import saat completion
                autoImportCompletions = true,

                -- Auto search paths
                autoSearchPaths = true,

                -- Diagnostic severity overrides
                diagnosticSeverityOverrides = {
                    reportUnusedImport = 'information',
                    reportUnusedVariable = 'information',
                    reportUnusedCallResult = 'information',
                    reportMissingTypeStubs = 'warning',
                },

                -- Use library code for types
                useLibraryCodeForTypes = true,

                -- Inlay hints (tipe variabel inline)
                inlayHints = {
                    callArgumentNames = true,
                    functionReturnTypes = true,
                    variableTypes = true,
                    genericTypes = true,
                },

                -- Indexing
                indexing = true,

                -- Log level
                logLevel = 'Warning',
            },

            -- Python path (otomatis detect, bisa override)
            -- pythonPath = vim.fn.exepath('python'),

            -- Venv path
            -- venvPath = '.',
            -- venv = '.venv',
        },
    },
}
