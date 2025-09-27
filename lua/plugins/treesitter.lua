return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  	event = { "BufReadPost", "BufNewFile" },    -- load only when you edit files
		opts = {
      ensure_installed = { "lua","python","go","c","cpp","bash","json","yaml","markdown","vim","query","javascript","typescript" },
      highlight = { enable = true },
      indent = { enable = true },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}

