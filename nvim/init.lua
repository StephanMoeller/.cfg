vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.opt.undofile = true
require("mappings")
vim.opt.updatetime = 5

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

require("lazy").setup("plugins") -- This loads all files inside /lua/plugins/

