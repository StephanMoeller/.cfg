return {
  "christoomey/vim-tmux-navigator",
  vim.keymap.set('n', '<M-Left>', ':TmuxNavigateLeft<CR>'),
  vim.keymap.set('n', '<M-Right>', ':TmuxNavigateRight<CR>'),
  vim.keymap.set('n', '<M-Up>', ':TmuxNavigateUp<CR>'),
  vim.keymap.set('n', '<M-Down>', ':TmuxNavigateDown<CR>')
}

