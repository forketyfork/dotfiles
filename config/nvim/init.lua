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
