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
  -- Catppuccin = Colorscheme
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  -- Telescope = File jumping
  { 'nvim-telescope/telescope.nvim', tag = '0.1.6', dependencies = { 'nvim-lua/plenary.nvim' } }, 
  {"nvim-treesitter/nvim-treesitter", build= ":TSUpdate"}, -- no idea

  -- Neo-tree = File tree explorer:
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
  }
}
require("lazy").setup(plugins, opts)

-- Setup: Colorscheme
require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"

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
