return {
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim", config = true },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "lua_ls","pyright","gopls","clangd","ts_ls" },
      automatic_installation = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {},
    config = function()
      local lsp = require("lspconfig")
      local cap = require("cmp_nvim_lsp").default_capabilities()
      local on_attach = function(_, bufnr)
        local map = function(m, lhs, rhs) vim.keymap.set(m, lhs, rhs, { buffer = bufnr, silent = true }) end
        map("n","gd", vim.lsp.buf.definition)
        map("n","gr", vim.lsp.buf.references)
        map("n","K",  vim.lsp.buf.hover)
        map("n","<leader>rn", vim.lsp.buf.rename)
        map("n","<leader>ca", vim.lsp.buf.code_action)
        map("n","<leader>f", function() vim.lsp.buf.format({ async = true }) end)
      end
      for _, s in ipairs({ "lua_ls","pyright","gopls","clangd","ts_ls" }) do
        lsp[s].setup({ capabilities = cap, on_attach = on_attach })
      end
      lsp.lua_ls.setup({
        capabilities = cap, on_attach = on_attach,
        settings = { Lua = { diagnostics = { globals = { "vim" } } } },
      })
    end,
  },
}

