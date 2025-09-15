return {
  {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
      require('mini.files').setup({
  			mappings = {
    			show_help = 'gh',
  			},
			})
			require('mini.icons').setup({style = 'ascii'})
			require('mini.pick').setup({})
			require('mini.snippets').setup({})
			require('mini.completion').setup({})
			
			vim.keymap.set('n', '<leader>e', require('mini.files').open)
			-- require("mini.comment").setup({})
      -- require("mini.statusline").setup({})
    end,
  },
}

