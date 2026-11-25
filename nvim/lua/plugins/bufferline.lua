-- Tab bar of open files along the top
return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "folke/snacks.nvim", -- for closing a file without wrecking the window layout
    },
    event = "VeryLazy",
    init = function()
        -- :BufDel closes the current file but keeps the window (and the tab bar/tree layout)
        vim.api.nvim_create_user_command("BufDel", function(cmd)
            require("snacks").bufdelete({ force = cmd.bang })
        end, { bang = true, desc = "Close file, keep window layout" })
        -- typing :bd (or :bd!) runs :BufDel instead; :bd with arguments still works as usual
        vim.keymap.set("ca", "bd", function()
            return (vim.fn.getcmdtype() == ":" and vim.fn.getcmdline() == "bd") and "BufDel" or "bd"
        end, { expr = true })
    end,
    keys = {
        { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous tab" },
        { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next tab" },
        { "<leader>bp", "<cmd>BufferLinePick<cr>", desc = "Pick a tab by letter" },
        { "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "Close all other tabs" },
        { "<leader>x", function() require("snacks").bufdelete() end, desc = "Close current tab" },
        { "<leader>1", "<cmd>BufferLineGoToBuffer 1<cr>", desc = "Go to tab 1" },
        { "<leader>2", "<cmd>BufferLineGoToBuffer 2<cr>", desc = "Go to tab 2" },
        { "<leader>3", "<cmd>BufferLineGoToBuffer 3<cr>", desc = "Go to tab 3" },
        { "<leader>4", "<cmd>BufferLineGoToBuffer 4<cr>", desc = "Go to tab 4" },
        { "<leader>5", "<cmd>BufferLineGoToBuffer 5<cr>", desc = "Go to tab 5" },
    },
    opts = {
        options = {
            close_command = function(n) require("snacks").bufdelete(n) end,
            right_mouse_command = function(n) require("snacks").bufdelete(n) end,
            diagnostics = "nvim_lsp",
            always_show_bufferline = true,
            separator_style = "slant",
            -- leave room above the file tree so tabs line up with the code
            offsets = {
                { filetype = "NvimTree", text = "Files", highlight = "Directory", separator = true },
            },
        },
    },
}
