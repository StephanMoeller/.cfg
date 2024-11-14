print("hey hey hey2")
require("core.mappings")

-- Tutorial: https://www.youtube.com/watch?v=zHTeCSVAFNY

-- PLUGIN MANAGER: setup lazyvim as the plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

-- PLUGINS: various plugins as part of the setup process of lazy.vim
local opts = {}
local plugins = {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { 'nvim-telescope/telescope.nvim', tag = '0.1.6', dependencies = { 'nvim-lua/plenary.nvim' } }
}
require("lazy").setup(plugins, opts)

-- Setup: Colorscheme
require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"

-- Setup: Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
