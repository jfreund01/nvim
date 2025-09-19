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
-- Use <leader>i to manually open the diagnostic float
vim.keymap.set('n', '<leader>i', function()
  vim.diagnostic.open_float(nil, {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  })
end, { noremap = true, silent = true })

-- Automatically show diagnostics in a floating window on CursorHold
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    })
  end,
})

vim.keymap.set({'n'}, 'L', '$')
vim.keymap.set({'n'}, 'H', '^')


-- Set insert mode mappings for auto-pairs
vim.keymap.set("i", "(", "()<Left>")
vim.keymap.set("i", "{", "{}<Left>")
vim.keymap.set("i", "[", "[]<Left>")
vim.keymap.set("i", "<", "<><Left>")
vim.keymap.set("i", "'", "''<Left>")
vim.keymap.set("i", "\"", "\"\"<Left>")

-- Special case: auto-indent block on Enter
vim.keymap.set("i", "{<CR>", "{<CR>}<Esc>O", { noremap = true })

-- Go to first non-blank character of the file
vim.keymap.set({"n", "v"}, "gg", "gg0", { noremap = true })
-- Go to last non-blank character of the file
vim.keymap.set({"n", "v"}, "G", "G$", { noremap = true })

vim.keymap.set({ "n", "x", "o" }, "s", function()
  require("flash").jump()
end, { desc = "Flash Jump" })

vim.keymap.set({"v"}, "<Tab>", ">gv")
vim.keymap.set("v", "<S-Tab>", "<gv")

vim.api.nvim_set_keymap("n", "<leader>tt", ":CyberdreamToggleMode<CR>", { noremap = true, silent = true })


vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { noremap = true, silent = true })

