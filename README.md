# Neovim configuration

![commitlint](https://img.shields.io/github/actions/workflow/status/CelticBoozer/nvim-config/commitlint.yaml?branch=master&label=commitlint)
![StyLua](https://img.shields.io/github/actions/workflow/status/CelticBoozer/nvim-config/stylua.yaml?branch=master&label=StyLua)
![luacheck](https://img.shields.io/github/actions/workflow/status/CelticBoozer/nvim-config/luacheck.yaml?branch=master&label=luacheck)
![yamllint](https://img.shields.io/github/actions/workflow/status/CelticBoozer/nvim-config/yamllint.yaml?branch=master&label=yamllint)
![yamlfmt](https://img.shields.io/github/actions/workflow/status/CelticBoozer/nvim-config/yamlfmt.yaml?branch=master&label=yamlfmt)
![markdownlint](https://img.shields.io/github/actions/workflow/status/CelticBoozer/nvim-config/markdownlint.yaml?branch=master&label=markdownlint)
![cspell](https://img.shields.io/github/actions/workflow/status/CelticBoozer/nvim-config/cspell.yaml?branch=master&label=cspell)

**Welcome to my Neovim configuration repository!** This config is designed as a
universal, extensible IDE setup for web and DevOps development. It emphasizes
modular Lua-based plugin configurations and best practices (e.g., one plugin per
file, LSP integration, and consistent style conventions).

## 🚀 Setup Instructions

1. **Install Neovim** (version >= 0.8) on your system.
2. **Clone this repo** into your config directory:

```bash
git clone https://github.com/CelticBoozer/nvim-config.git ~/.config/nvim
```
<!-- markdownlint-disable-file MD029 -->
3. Install plugin manager (lazy.nvim) will automatically setup on first launch.
4. Open Neovim and let it install plugins.
5. Install external dependencies listed below.
<!-- markdownlint-diable-file MD013 -->
|External Dependency | Plugins |
|--------------------|---------|
| [git](https://git-scm.com/downloads) | [lazy.nvim](https://github.com/folke/lazy.nvim) [neogit](https://github.com/NeogitOrg/neogit) [mason.nvim](https://github.com/williamboman/mason.nvim) |
| [Nerd Font](https://www.nerdfonts.com/) | [lazy.nvim](https://github.com/folke/lazy.nvim) [render-markdown](https://github.com/MeanderingProgrammer/render-markdown.nvim) [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) [which-key.nvim](https://github.com/folke/which-key.nvim) |
| [luarocks](https://luarocks.org/) | [lazy.nvim](https://github.com/folke/lazy.nvim) |
| [curl](https://curl.se/download.html) | [mason.nvim](https://github.com/williamboman/mason.nvim) |
| [wget](https://www.gnu.org/software/wget/) | [mason.nvim](https://github.com/williamboman/mason.nvim) |
| unzip | [mason.nvim](https://github.com/williamboman/mason.nvim) |
| tar | [mason.nvim](https://github.com/williamboman/mason.nvim) |
| gzip | [mason.nvim](https://github.com/williamboman/mason.nvim) |
| [rg](https://github.com/BurntSushi/ripgrep) | [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) |
| [fd](https://github.com/sharkdp/fd) | [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) |

## 🌟 Features

- Modular Plugin Setup: Each plugin config is in its own Lua file (e.g.,
lua/plugin/git/git.lua), promoting clarity and easy updates.
- LSP & Treesitter: Built-in support for many languages via Mason, lspconfig,
and Treesitter.
- Completion & Snippets: Autocompletion with nvim-cmp and Luasnip.
- Statusline & Icons: Beautiful statusline (lualine) and file icons
(nvim-web-devicons) with auto color adaptation.
- Git Integration: Lazy-loaded Git plugins (e.g., lazygit) for in-editor
version control.
- Theming: Gruvbox Material colorscheme with UI tweaks, plus dynamic icon
coloring.
- Quickkey Hints: which-key integration for discovering keybindings.

## 📚 Usage Examples
<!-- markdownlint-disable-file MD033 -->
- Open Telescope file search: <leader>ff
- Toggle NvimTree: <leader>te
- Git status (lazygit): <leader>gg
- LSP actions: <leader>aa for code actions, <leader>tl for diagnostics, etc.
- Color preview: Hex color codes will display actual colors via nvim-colorizer.lua
when opening relevant files.

[PLACE IMAGE HERE] – (e.g., screenshot of Neovim with this config)

## ⭐ Stay Updated

If you find this configuration helpful, consider starring the repo! Feedback
and suggestions are always appreciated.
