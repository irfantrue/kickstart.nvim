# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a kickstart.nvim-based Neovim configuration with custom plugins for Go, TypeScript, and Solidity development.

## Architecture

Configuration is split into three main directories:

- `init.lua` - Entry point that bootstraps lazy.nvim plugin manager
- `lua/config/` - Core Neovim settings (options, keymaps, autocmds)
- `lua/custom/plugins/` - Custom plugin configurations
- `lua/kickstart/plugins/` - Kickstart-provided plugin configurations
- `lua/config/lsp/` - Language server configurations (gopls, solidityls)
- `lua/config/lint/` - Linter configurations (solhint)
- `lua/config/vim-go.lua` - Go keybindings
- `lua/config/harpoon.lua` - Harpoon keybindings

## Keybindings

### General
| Key | Description |
|-----|-------------|
| `<C-j/k>` | Move line(s) down/up |
| `<C-h/l>` | Dedent/indent line(s) |
| `<leader><Tab>` | Toggle nvim-tree file explorer |
| `<leader>\` | Toggle Aerial symbol outline |
| `<leader>st` | Search TODO comments via Telescope |
| `]c` / `[c` | Next/previous git hunk |
| `<F5>` | DAP continue |
| `<F1-3>` | DAP step into/over/out |
| `<F7>` | Toggle DAP UI

### Harpoon
| Key | Description |
|-----|-------------|
| `<leader>ma` | Add current file |
| `<leader>ml` | Show file list |
| `<leader>mr` | Remove file |
| `<leader>mc` | Clear list |
| `<leader>m[1-4]` | Jump to slot 1-4 |

### Git (gitsigns)
| Key | Description |
|-----|-------------|
| `<leader>hs` | Stage hunk |
| `<leader>hr` | Reset hunk |
| `<leader>hS` | Stage buffer |
| `<leader>hR` | Reset buffer |
| `<leader>hu` | Undo stage hunk |
| `<leader>hp` | Preview hunk |
| `<leader>hb` | Blame line |
| `<leader>hd` | Diff against index |
| `<leader>hD` | Diff against last commit |
| `<leader>tb` | Toggle blame line |
| `<leader>tD` | Toggle deleted inline |

### Go (vim-go)
| Key | Description |
|-----|-------------|
| `<leader>gr` | Run, Remove and Rename |
| `<leader>gb` | Build (compile) |
| `<leader>gi` | Install and implement |
| `<leader>gt` | Test (run all tests) |
| `<leader>gtf` | Test func (run at cursor) |
| `<leader>gtc` | Test compile (verify only) |
| `<leader>gc` | Coverage (toggle display) |
| `<leader>gat` | Add tags (json default) |
| `<leader>gaT` | Add tags (custom input) |
| `<leader>grt` | Remove tags |
| `<leader>grT` | Remove tags (custom input) |
| `<leader>gfs` | Fill struct (literals) |
| `<leader>gfp` | Fill params (arguments) |
| `<leader>ge` | If err (wrap return) |
| `<leader>gim` | Impl (generate interface stub) |
| `<leader>gg` | Generate (run go:generate) |
| `<leader>gd` | Doc (show symbol docs) |
| `<leader>gI` | Info (type at cursor) |
| `<leader>gre` | Rename (refactor symbol) |

**Which-key groups:** `<leader>ga` (Add Tags), `<leader>gf` (Fill), `<leader>gr` (Run/Build), `<leader>gt` (Test), `<leader>gd` (Docs)

## Language Support

### Go
- `vim-go` with disabled LSP (uses gopls via nvim-lspconfig)
- Config: `lua/config/vim-go.lua`
- Debugging via nvim-dap with delve

### TypeScript/JavaScript
- typescript-tools.nvim (single tsserver per project)
- Inlay hints, code lens, organized imports

### Solidity
- nomicfoundation-solidity-language-server
- solhint linting (requires `bun install -g solhint`)

## Plugins

**Custom** (`lua/custom/plugins/`):
- `harpoon` - File navigation (config in `lua/config/harpoon.lua`)
- `rose-pine` - Color scheme with custom palette
- `lualine` - Statusline with custom theme
- `aerial` - Symbol navigation
- `nvim-tree` - File explorer
- `colorizer` - Hex color preview
- `render-markdown` - Markdown rendering
- `typescript-tools` - TypeScript LSP
- `vim-go` - Go development

**Kickstart** (`lua/kickstart/plugins/`):
- `nvim-dap` - Debug adapter protocol
- `gitsigns` - Git integration
- `nvim-lint` - Linting framework
- `indent-blankline` - Indentation guides
- `nvim-autopairs` - Auto-closing pairs
- `neo-tree` - Alternative file browser

## Commands

- `:Lazy` - Open lazy.nvim plugin manager
- `:Lazy sync` - Sync/update plugins
- `:Mason` - Open LSP/installer UI
- `:checkhealth` - Run Neovim health checks
- `:TodoTelescope` - Search TODOs

## Dependencies

Required: `git`, `make`, `unzip`, `gcc`, `ripgrep`, `fd`, `tree-sitter-cli`

Language-specific:
- Go: `go`, `delve` (debugging)
- TypeScript: `npm`
- Solidity: `bun`, `solhint`
