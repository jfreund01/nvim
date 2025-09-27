-- plugins/colors.lua (or wherever your specs live)
return {
  {
    "folke/tokyonight.nvim",
    lazy = false,        -- load at startup
    priority = 1000,     -- make sure it loads before other UI plugins
    opts = {
      -- pick one: "storm", "night", "moon", "day"
      style = "moon",
      transparent = false,
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = false },
        sidebars = "dark",
        floats = "dark",
      },
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd.colorscheme("tokyonight")
    end,
  },
}

