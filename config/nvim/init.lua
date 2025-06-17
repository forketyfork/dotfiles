-- lazy.vim package manager configuration and plugins
require('config.lazy')

-- LSP configuration
require('config.lsp')

-- Autocompletion setup
require('config.cmp')

-- Formatting setup
require('config.conform')

-- search and replace functionality
vim.opt.ignorecase = true -- search case insensitive
vim.opt.smartcase = true -- search matters if the string starts with a capital letter
vim.opt.inccommand = "split" -- incremental search, show substitution preview

-- enable syntax highlighting
vim.opt.syntax = "on"
-- auto-indent
vim.opt.autoindent = true
-- filetype detection
vim.opt.filetype = "on"
-- show line numbers
vim.opt.number = true
-- enables true color support
vim.opt.termguicolors = true
-- color scheme
vim.cmd.colorscheme("gruvbox")
-- tab spacing
vim.opt.tabstop = 4
-- unify
vim.opt.softtabstop = 4
-- indent/outdent by 4 columns
vim.opt.shiftwidth = 4
-- always indent/outdent to the nearest tabstop
vim.opt.shiftround = true
-- use spaces instead of tabs
vim.opt.expandtab = true
-- use tabs at the start of a line, spaces elsewhere
vim.opt.smarttab = true
-- python host
vim.g.python3_host_prog='/run/current-system/sw/bin/python'

-- key bindings
vim.g.mapleader = ","
local keyset = vim.keymap.set
keyset("n", "<leader>sr", ":%s/<C-r><C-w>//g<Left><Left>")

-- show diagnostics on gh
vim.keymap.set("n", "gh", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
