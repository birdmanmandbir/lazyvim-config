# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a LazyVim-based Neovim configuration that uses lazy.nvim as its plugin manager. The configuration follows a modular, declarative approach with minimal customization on top of LazyVim's defaults.

## Common Development Tasks

### Formatting Lua Code
```bash
# Format all Lua files (stylua is configured with 2-space indentation, 120 column width)
stylua .
```

### Managing Plugins
- Add new plugins by creating files in `lua/plugins/`
- Use the disabled `lua/plugins/example.lua` as a template for plugin configuration
- After adding/modifying plugins, restart Neovim and lazy.nvim will automatically install/update them

### Checking Plugin Updates
- Inside Neovim: `:Lazy` to open the lazy.nvim interface
- Press `U` to update plugins
- The `lazy-lock.json` file pins versions for reproducibility

## Architecture

### Core Structure
- **Entry Point**: `init.lua` - Minimal bootstrap that loads lazy.lua
- **Configuration Directory**: `lua/` - All Lua configuration files
  - `config/` - Core settings (lazy.lua bootstraps the plugin manager)
  - `plugins/` - Plugin specifications (each file returns plugin specs)

### Plugin Management Strategy
1. LazyVim core plugins are loaded via `{ "LazyVim/LazyVim", import = "lazyvim.plugins" }`
2. Custom plugins in `lua/plugins/` are loaded automatically
3. Plugins are loaded eagerly by default (`lazy = false`)

### Key Customizations
The main customization is Swift/iOS development support:
- Swift TreeSitter parser for syntax highlighting
- sourcekit-lsp configuration for Swift language server
- swift.vim plugin for additional Swift support
- xcodebuild.nvim for Xcode project integration

### LazyVim Extras
Many LazyVim extras are enabled (see `lazyvim.json`), including:
- Language support: Go, Rust, TypeScript, Markdown, YAML, and more
- Editor enhancements: mini-surround, yanky, mini-files, navic
- Coding utilities: dot file support, pattern highlighting

## Important Notes
- This configuration inherits most settings from LazyVim defaults
- The `config/options.lua`, `config/keymaps.lua`, and `config/autocmds.lua` files are intentionally empty
- To override LazyVim defaults, add configurations to these files
- Mason automatically installs LSPs, formatters, and linters on first run