return {
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    opts = {
      suggestion = {
        enabled = true,          -- ghost text ON
        auto_trigger = true,     -- show as you type
        keymap = {
          accept = "<C-l>",      -- pick your keys
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
      panel = { enabled = false },
      filetypes = { ["*"] = true, TelescopePrompt = false },
    },
  },
  -- IMPORTANT: remove/copilot-cmp if you add it elsewhere
  -- (we're NOT blending into cmp now)
}
