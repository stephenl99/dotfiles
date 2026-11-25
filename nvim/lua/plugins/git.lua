-- Git: change markers in the gutter (gitsigns) and full side-by-side diffs (diffview)
return {
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            current_line_blame = false, -- toggle with \gB
            on_attach = function(bufnr)
                local gs = require("gitsigns")
                local map = function(lhs, rhs, desc)
                    vim.keymap.set("n", lhs, rhs, { buffer = bufnr, desc = desc })
                end
                -- jump between changes (in diff mode, keep vim's built-in ]c / [c)
                map("]c", function()
                    if vim.wo.diff then vim.cmd.normal({ "]c", bang = true }) else gs.nav_hunk("next") end
                end, "Next git change")
                map("[c", function()
                    if vim.wo.diff then vim.cmd.normal({ "[c", bang = true }) else gs.nav_hunk("prev") end
                end, "Previous git change")
                map("<leader>gp", gs.preview_hunk, "Preview change")
                map("<leader>gs", gs.stage_hunk, "Stage change (again to unstage)")
                map("<leader>gr", gs.reset_hunk, "Undo change")
                map("<leader>gS", gs.stage_buffer, "Stage whole file")
                map("<leader>gb", function() gs.blame_line({ full = true }) end, "Who changed this line")
                map("<leader>gB", gs.toggle_current_line_blame, "Toggle inline blame")
            end,
        },
    },
    {
        "sindrets/diffview.nvim",
        cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
        keys = {
            { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diff all changes" },
            { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "History of this file" },
            { "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "History of the repo" },
            { "<leader>gq", "<cmd>DiffviewClose<cr>", desc = "Close diff view" },
        },
    },
}
