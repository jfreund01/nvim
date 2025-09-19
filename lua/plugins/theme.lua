return {
--  {
--    "navarasu/onedark.nvim",
--    lazy = false,      -- load at startup
--    priority = 1000,   -- load before other plugins
--    config = function()
--      require("onedark").setup {
--        style = "cool", -- options: dark, darker, cool, deep, warm, warmer, light
--      }
--      require("onedark").load()
--    end,
--  },
--}
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		config = function()
	 		require("cyberdream").setup({
				transparent = true,
			  italic_comments = true,
				hide_fillchars = false,
				extensions = {
					mini = true,
					noice = true,
				},
			})
		vim.cmd("colorscheme cyberdream")
		end,
	},
}
