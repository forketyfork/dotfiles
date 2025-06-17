-- bootstrap for lazy.vim plugin manager
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

-- define the plugins installed via lazy.vim
require("lazy").setup({
    {
        "stevearc/conform.nvim",
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            vim.cmd.colorscheme "catppuccin"
        end
    },
    {
        "folke/tokyonight.nvim",
        name = "tokyonight",
        priority = 1000,
        config = function()
            vim.cmd.colorscheme "tokyonight"
        end
    },
    {
        "ellisonleao/gruvbox.nvim",
        name = "gruvbox",
        priority = 1000,
        config = function()
            vim.cmd.colorscheme "gruvbox"
        end
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        priority = 1000,
        config = function()
            vim.cmd.colorscheme "rose-pine"
        end
    },
    -- LSP server configuration
    {
        "neovim/nvim-lspconfig"
    },
    -- autocompletion
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'L3MON4D3/LuaSnip',
        }
    }
}, {
    rocks = {
        enabled = false,
    }
})


