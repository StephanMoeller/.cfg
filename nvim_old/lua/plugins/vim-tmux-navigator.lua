return {
  "christoomey/vim-tmux-navigator",
  vim.keymap.set('n', '<m-left>', ':tmuxnavigateleft<cr>'),
  vim.keymap.set('n', '<m-right>', ':tmuxnavigateright<cr>'),
  vim.keymap.set('n', '<m-up>', ':tmuxnavigateup<cr>'),
  vim.keymap.set('n', '<m-down>', ':tmuxnavigatedown<cr>'),

  vim.keymap.set('i', '<m-left>', ':tmuxnavigateleft<cr>'),
  vim.keymap.set('i', '<m-right>', ':tmuxnavigateright<cr>'),
  vim.keymap.set('i', '<m-up>', ':tmuxnavigateup<cr>'),
  vim.keymap.set('i', '<m-down>', ':tmuxnavigatedown<cr>'),

  vim.keymap.set('v', '<m-left>', ':tmuxnavigateleft<cr>'),
  vim.keymap.set('v', '<m-right>', ':tmuxnavigateright<cr>'),
  vim.keymap.set('v', '<m-up>', ':tmuxnavigateup<cr>'),
  vim.keymap.set('v', '<m-down>', ':tmuxnavigatedown<cr>')
}

