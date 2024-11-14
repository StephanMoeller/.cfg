vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

require("mappings")

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

require("lazy").setup("plugins") -- This loads the object returned in /lua/plugins.lua

-- Setup: Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

-- Setup: Treesitter
local config = require("nvim-treesitter.configs")
config.setup({
  ensure_installed = {"lua", "javascript"},
  highlight = { enable = true },
  indent = { enable = true }
})

-- Setup:
vim.keymap.set('n', '<M-e>', ':Neotree filesystem reveal left<CR>') 
