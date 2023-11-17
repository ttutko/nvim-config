-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require "user.options"

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

require("lazy").setup({
  {
    "folke/tokyonight.nvim",
    lazy=false,
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd.colorscheme 'tokyonight'
    end,
  },
  { "ellisonleao/gruvbox.nvim", priority = 1000 },
  { "Mofiqul/dracula.nvim", priority = 1000 },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "nvim-tree/nvim-tree.lua" },
  { "nvim-tree/nvim-web-devicons" },
  { import = 'user.plugins' },
}, opts)

require("user.plugin_config")
require("user.keymaps")
