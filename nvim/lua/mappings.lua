-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode

vim.keymap.set('n', '<a-e>', ':Neotree<Enter>', { desc = 'Show files' })
vim.keymap.set('n', '<a-b>', ':Neotree buffers right<Enter>', { desc = 'Show buffers' })
--vim.keymap.set('n', '<escape>', ':echo "esc!"', { desc = 'Show files' })

vim.keymap.set('n', '<C-M-PageUp>', ':bprevious<CR>', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '<C-M-PageDown>', ':bnext<CR>', { desc = 'Move focus to the upper window' })


-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<s-Left>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<s-Right>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<s-Down>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<s-Up>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })










-- PROGRAMMING: Add comma and semicolon to the end of the current line
vim.keymap.set('n', ';', 'mzA;<Esc>`z<Down>', { desc = 'Add ; to the end of the current line' })
vim.keymap.set('n', ',', 'mzA,<Esc>`z<Down>', { desc = 'Add ; to the end of the current line' })
vim.keymap.set('n', 'K', 'mzJ`z', { desc = 'Join lines' })
vim.keymap.set('n', 'k', 'f,wi<enter><esc>', { desc = 'Split lines' })
vim.keymap.set('n', 'U', '<c-r>', { desc = 'Redo' })
vim.keymap.set('n', '<leader>y', '"+y', { desc = 'Copy to clipboard' })
vim.keymap.set('v', '<leader>y', '"+y', { desc = 'Copy to clipboard' })
vim.keymap.set('n', '<leader>p', '"+p', { desc = 'Paste from clipboard' })
vim.keymap.set('v', '<leader>p', '"+p', { desc = 'Paste from clipboard' })
vim.keymap.set('n', '<c-p>', '"0p', { desc = 'Paste last yanked' })
vim.keymap.set('v', '<c-p>', '"0p', { desc = 'Paste last yanked' })
vim.keymap.set('n', '*', '*zz', { desc = 'Center when *' })
vim.keymap.set('n', 'n', 'nzz', { desc = 'Center when n' })

-- Home and end go to first and last non space character 
vim.keymap.set('n', '<Home>', '<Home>_', { desc = 'Home => first non space' })
vim.keymap.set('v', '<Home>', '<Home>_', { desc = 'Home => first non space' })
vim.keymap.set('i', '<Home>', '<esc><home>_i', { desc = 'Home => first non space' })
vim.keymap.set('n', '<End>', 'g_', { desc = 'End => last non space' })
vim.keymap.set('v', '<End>', 'g_', { desc = 'End => last non space' })
vim.keymap.set('i', '<End>', '<esc>g_a', { desc = 'End => last non space' })
vim.keymap.set('n', '<c-a>', 'ggvG', { desc = 'Select all' })
vim.keymap.set('n', '<c-z>', 'zz', { desc = 'Select all' })
vim.keymap.set('n', '<c-Up>', '10<Up>zz', { desc = 'Navigate with crlt arrows instead of c-d and c-u' })
vim.keymap.set('v', '<c-Up>', '10<Up>zz', { desc = 'Navigate with crlt arrows instead of c-d and c-u' })
vim.keymap.set('n', '<c-Down>', '10<Down>zz', { desc = 'Navigate with crlt arrows instead of c-d and c-u' })
vim.keymap.set('v', '<c-Down>', '10<Down>zz', { desc = 'Navigate with crlt arrows instead of c-d and c-u' })
vim.keymap.set('n', 'h', 'v', { desc = 'Use h instead of v for ergo reasons' })
vim.keymap.set('n', 'H', 'V', { desc = 'Use h instead of v for ergo reasons' })
vim.keymap.set('v', 'h', 'v', { desc = 'Use h instead of v for ergo reasons' })
vim.keymap.set('v', 'H', 'V', { desc = 'Use h instead of v for ergo reasons' })
vim.keymap.set("v", "<a-Down>", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
vim.keymap.set("v", "<a-Up>", ":m '<-2<CR>gv=gv", { desc = "Move selected lines down" })
vim.keymap.set("n", "<a-Down>", "V:m '>+1<CR>gv=gv<Esc>", { desc = "Move selected lines down" })
vim.keymap.set("n", "<a-Up>", "V:m '<-2<CR>gv=gv<Esc>", { desc = "Move selected lines down" })
-- Go to definition
--nnoremap <c-e> gd

--" Things to setup in ide:
--" ctrl e: Go to implementation
--" ctrl i: back
--" ctrl o: forward
--" alt a: Close other tabs

