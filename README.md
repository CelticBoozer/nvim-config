# :hammer_and_wrench: Neovim configuration

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

![preview](.github/assets/full.png)

## 🚀 Setup Instructions

1. **Install Neovim** on your system.
2. **Clone this repo** into your config directory:
3. Install plugin manager (lazy.nvim) will automatically setup on first launch.
4. Open Neovim and let it install plugins.
5. Install external dependencies listed below.
<!-- markdownlint-disable MD013 -->
| External Dependency                                      | Plugins                                                                                                                                             |
| -------------------------------------------------------- |---------------------------------------------------------------------------------------------------------------------------------------------------- |
| **git**                                                  | `gitsigns.nvim`, `auto-session`, `dashboard-nvim`                                                                                                   |
| **ripgrep (`rg`)**                                       | `telescope.nvim`, `search.nvim`, `todo-comments.nvim`                                                                                               |
| **fd**                                                   | `telescope.nvim`, `search.nvim`                                                                                                                     |
| **docker**                                               | `telescope-docker.nvim`                                                                                                                             |
| **docker-compose**                                       | `telescope-docker.nvim`                                                                                                                             |
| **docker-machine**, **buildx**                           | `telescope-docker.nvim`                                                                                                                             |
| **bash**                                                 | `nvim-dap` via `bash-debug-adapter`, `neotest-bas                                                                                                   |
| **node**                                                 | `nvim-dap` via `firefox-debug-adapter`, `neotest-jest`, `conform.nvim` (formatters), many Telescope extensions (`telescope-media-files.nvim`, etc.) |
| **python3**                                              | `nvim-dap` via `debugpy`, `neotest-python`, `conform.nvim` (formatters), `nvim-lint` (linters)                                                      |
| **java** / **javac**                                     | `conform.nvim` (`google-java-format`), `nvim-lspconfig` (`jdtls`), `nvim-treesitter` (Java parser)                                                  |
| **unzip**, **wget**, **curl**, **gzip**, **tar**, **sh** | `mason.nvim`                                                                                                                                        |
| **npm** / **npx**                                        | `mason-tool-installer.nvim`, `conform.nvim` (formatters)                                                                                            |
| **tree-sitter-cli**                                      | `nvim-treesitter` (only needed if you run `:TSInstallFromGrammar`), `lspsaga.nvim`                                                                  |
| **luarocks**, **Lua 5.1**                                | `nvim-colorizer.lua`, `virt-column.nvim`, other plugins that bundle native extensions via LuaRocks                                                  |
| **fonts** (Nerd Fonts: Hack, JetBrains Mono, DevIcons)   | `bufferline.nvim`, `lualine.nvim`, `statuscol.nvim`, `nvim-web-devicons`, `which-key.nvim`, `dashboard-nvim`                                        |
| **fzf**                                                  | `search.nvim`                                                                                                                                       |
| **pandoc** / **latex2html**                              | `render-markdown.nvim` (LaTeX block rendering)                                                                                                      |
| **chafa**                                                | `telescope-media-files.nvim`                                                                                                                        |
| **sqlite**                                               | `yanky.nvim`                                                                                                                                        |

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

## :heart: Acknowledgements

I would like to thank the entire community, anyone who uses or is inspired by
my config. To everyone who inspired or helped me (I tried to indicate each
author in each script or file I borrowed fully or partially).

If you like this project and want to express your gratitude - star this
repository. Or you can donate.

### :star: Star history

[![Star History Chart](https://api.star-history.com/svg?repos=CelticBoozer/nvim-config&type=Timeline&theme=dark)](https://star-history.com/#CelticBoozer/nvim-config&Timeline)

### :coin: Donation
<!-- cSpell:disable -->
| ![USDT-TRC20](.github/assets/USDT.jpg)     | ![BTC](.github/assets/BTC.jpg)             | ![ETH](.github/assets/ETH.jpg)             |
| ------------------------------------------ | ------------------------------------------ | ------------------------------------------ |
| USDT TRC20                                 | BTC                                        | ETH                                        |
| TGhY5bCn12EDP3MGgs8Qg4YerczhP3PsC5         | bc1qru2p84r3zecva68e804jtjqp923mx2eekqwg3a | 0xb00d88737B0BD4f5cb5fc7519b3d27045b796ceb |
