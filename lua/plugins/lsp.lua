return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = true,
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp", -- optional, for capabilities
    },
    config = function()
			-- Filter lspconfig deprecation notices
			local lspconfig = require("lspconfig")

      -- make capabilities even if cmp isn't loaded
      local ok_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      if ok_cmp then
        capabilities = cmp_lsp.default_capabilities(capabilities)
      end

      local on_attach = function(_, bufnr)
        local map = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
        end
        map("n", "gd", vim.lsp.buf.definition, "Go to definition")
        map("n", "gr", vim.lsp.buf.references, "References")
        map("n", "K",  vim.lsp.buf.hover, "Hover")
        map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
        map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
        map("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end, "Format")
      end

      -- ensure mason + mason-lspconfig are set up here (so order can't bite us)
      local mason_lspconfig = require("mason-lspconfig")
      mason_lspconfig.setup({
        ensure_installed = { "lua_ls", "pyright", "gopls", "clangd", "ts_ls" },
        automatic_installation = true,
      })

      local base_opts = { capabilities = capabilities, on_attach = on_attach }

      if mason_lspconfig.setup_handlers then
        -- modern API path
        mason_lspconfig.setup_handlers({
          function(server_name)
            local opts = vim.tbl_deep_extend("force", {}, base_opts)
            if server_name == "lua_ls" then
              opts.settings = { Lua = { diagnostics = { globals = { "vim" } } } }
            end
            lspconfig[server_name].setup(opts)
          end,
        })
      else
        -- fallback path if setup_handlers is missing
        for _, server_name in ipairs(mason_lspconfig.get_installed_servers()) do
          local opts = vim.tbl_deep_extend("force", {}, base_opts)
          if server_name == "lua_ls" then
            opts.settings = { Lua = { diagnostics = { globals = { "vim" } } } }
          end
          lspconfig[server_name].setup(opts)
        end
      end
    end,
  },
}

