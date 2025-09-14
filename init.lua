vim.g.mapleader = vim.keycode('<Space>')
require("config.options")
require("config.keymaps")
require("config.autocmds")

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git","clone","--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git","--branch=stable",lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- load plugin specs from lua/plugins/*.lua
require("lazy").setup({
  { import = "plugins" },  -- auto-load every file that returns a spec or list of specs
}, { checker = { enabled = true } })

