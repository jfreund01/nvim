return {
  {
    "romgrk/barbar.nvim",
    version = "^1.0.0",
    dependencies = {
      "lewis6991/gitsigns.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    init = function()
      vim.g.barbar_auto_setup = false
      -- UI prerequisites
      vim.o.termguicolors = true
      vim.o.showtabline = 2   -- always show tabline
    end,
    main = "barbar",
    opts = {
      -- your options; example:
      -- auto_hide = false,
    },

    -- Eager-load (choose ONE of these three approaches):

    -- 1) Load immediately (simplest)
    -- lazy = false,

    -- 2) Or load once UI is ready
    event = "UIEnter",

    -- 3) Or load on typical buffer events
    -- event = { "BufReadPost", "BufNewFile" },

    keys = {
      { "<leader>1", "<Cmd>BufferGoto 1<CR>", desc = "Buffer 1", silent = true },
      { "<leader>2", "<Cmd>BufferGoto 2<CR>", desc = "Buffer 2", silent = true },
      { "<leader>3", "<Cmd>BufferGoto 3<CR>", desc = "Buffer 3", silent = true },
      { "<leader>4", "<Cmd>BufferGoto 3<CR>", desc = "Buffer 3", silent = true },
      { "<leader>5", "<Cmd>BufferGoto 3<CR>", desc = "Buffer 3", silent = true },
      { "<leader>6", "<Cmd>BufferGoto 3<CR>", desc = "Buffer 3", silent = true },
      { "<leader>7", "<Cmd>BufferGoto 3<CR>", desc = "Buffer 3", silent = true },
      { "<leader>8", "<Cmd>BufferGoto 3<CR>", desc = "Buffer 3", silent = true },
      { "<leader>9", "<Cmd>BufferGoto 3<CR>", desc = "Buffer 3", silent = true },
 			{ "<Tab>",     "<Cmd>BufferNext<CR>",     desc = "Next buffer",     silent = true },
      { "<S-Tab>",   "<Cmd>BufferPrevious<CR>", desc = "Previous buffer", silent = true },
    },
  },
}

