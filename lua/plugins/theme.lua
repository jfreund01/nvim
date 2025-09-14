return {
  {
    "navarasu/onedark.nvim",
    lazy = false,      -- load at startup
    priority = 1000,   -- load before other plugins
    config = function()
      require("onedark").setup {
        style = "cool", -- options: dark, darker, cool, deep, warm, warmer, light
      }
      require("onedark").load()
    end,
  },
}

