-- Scrollbar on the right edge showing where things are in the whole file,
-- like VSCode's overview ruler: git changes, errors/warnings, search matches, marks.
return {
    "lewis6991/satellite.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
        current_only = false,   -- show it in every window, not just the focused one
        winblend = 30,          -- slightly see-through so it doesn't hide code
        excluded_filetypes = { "NvimTree", "DiffviewFiles", "DiffviewFileHistory", "lazy" },
        handlers = {
            gitsigns = { enable = true },
            diagnostic = { enable = true },
            search = { enable = true },
            marks = { enable = true },
            cursor = { enable = true },
        },
    },
}
