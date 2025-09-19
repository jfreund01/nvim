vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- Open a new empty buffer
    vim.cmd("enew")
    vim.bo.buflisted = false
    vim.bo.buftype = "nofile"
    vim.bo.swapfile = false
    vim.bo.bufhidden = "wipe"

    -- Disable line numbers and cursorline
    vim.wo.number = false
    vim.wo.relativenumber = false
    vim.wo.cursorline = false

    -- ASCII Art
    local ascii = {
      "██╗    ██╗   ██╗███████╗███████╗    ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗     ██╗██████╗ ████████╗██╗    ██╗██╗ ",
      "██║    ██║   ██║██╔════╝██╔════╝    ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║    ██╔╝██╔══██╗╚══██╔══╝██║    ██║╚██╗",
      "██║    ██║   ██║███████╗█████╗      ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║    ██║ ██████╔╝   ██║   ██║ █╗ ██║ ██║",
      "██║    ██║   ██║╚════██║██╔══╝      ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║    ██║ ██╔══██╗   ██║   ██║███╗██║ ██║",
      "██║    ╚██████╔╝███████║███████╗    ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║    ╚██╗██████╔╝   ██║   ╚███╔███╔╝██╔╝",
      "╚═╝     ╚═════╝ ╚══════╝╚══════╝    ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝     ╚═╝╚═════╝    ╚═╝    ╚══╝╚══╝ ╚═╝ ",
    }

    -- Get window dimensions
    local win_height = vim.api.nvim_win_get_height(0)
    local win_width = vim.api.nvim_win_get_width(0)

    -- Calculate vertical padding
    local pad_top = math.floor((win_height - #ascii) / 2)

    -- Insert blank lines for vertical centering
    for _ = 1, pad_top do
      vim.api.nvim_buf_set_lines(0, -1, -1, false, { "" })
    end

    -- Insert ASCII lines with horizontal centering
    for _, line in ipairs(ascii) do
      local pad = math.floor((win_width - vim.fn.strdisplaywidth(line)) / 2)
      local padded_line = string.rep(" ", math.max(pad, 0)) .. line
      vim.api.nvim_buf_set_lines(0, -1, -1, false, { padded_line })
    end

    -- Make buffer unmodifiable and add quit key
    vim.cmd("setlocal nomodifiable")
    vim.keymap.set("n", "q", ":q<CR>", { buffer = true, silent = true })
  end,
})

