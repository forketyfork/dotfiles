-- search and replace functionality
vim.opt.ignorecase = true -- search case insensitive
vim.opt.smartcase = true -- search matters if the string starts with a capital letter
vim.opt.inccommand = "split" -- incremental search, show substitution preview

-- key bindings
vim.g.mapleader = ","
local keyset = vim.keymap.set
keyset("n", "<leader>sr", ":%s/<C-r><C-w>//g<Left><Left>")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")

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


