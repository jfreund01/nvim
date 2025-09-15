vim.keymap.set({'n', 'x'}, 'gv', '"+p', {desc = 'Paste clipboard text'})
vim.keymap.set({'n', 'x'}, 'gc', '"+y', {desc = 'Copy to clipboard'})
vim.keymap.set('n', '<leader>w', '<cmd>write<cr>', {desc = 'Save file'})
vim.keymap.set('n', '<leader>q', '<cmd>quitall<cr>', {desc = 'Exit vim'})
vim.keymap.set('n', '<leader><space>', '<cmd>Pick buffers<cr>', {desc = 'Search open files'})
vim.keymap.set('n', '<leader>ff', '<cmd>Pick files<cr>', {desc = 'Search all files'})
vim.keymap.set('n', '<leader>fh', '<cmd>Pick help<cr>', {desc = 'Search help tags'})
vim.keymap.set('n', '<leader><space>',
  function() require('mini.pick').builtin.buffers() end,
  { desc = 'Search open buffers' })
-- Lua version (init.lua)
vim.keymap.set("n", "<leader>Y", ":%y+<CR>", { desc = "Yank entire file to system clipboard" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
