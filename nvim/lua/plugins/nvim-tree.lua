-- File explorer sidebar (press g? inside the tree for all keys)
return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- file-type icons (needs a Nerd Font)
    -- load at startup so `nvim .` / `nvim some/folder` opens the tree
    -- (netrw is disabled in config/options.lua, so nothing else can show folders)
    lazy = false,
    keys = {
        { "<C-n>", "<cmd>NvimTreeToggle<cr>", desc = "Toggle file tree" },
        { "<leader>e", "<cmd>NvimTreeFindFile<cr>", desc = "Reveal current file in tree" },
    },
    cmd = { "NvimTreeToggle", "NvimTreeFindFile", "NvimTreeOpen" },
    opts = {
        on_attach = function(bufnr)
            local api = require("nvim-tree.api")
            api.config.mappings.default_on_attach(bufnr)
            local map = function(lhs, rhs, desc)
                vim.keymap.set("n", lhs, rhs, { buffer = bufnr, desc = "nvim-tree: " .. desc, nowait = true })
            end
            -- free up Ctrl-k (it's "file info" by default) so Ctrl-h/j/k/l window navigation works here too
            vim.keymap.del("n", "<C-k>", { buffer = bufnr })
            -- d moves to the macOS Trash (recoverable); D deletes permanently
            map("d", api.fs.trash, "Move to Trash")
            map("D", api.fs.remove, "Delete permanently")
            -- bd on marked files: trash them too
            map("bd", api.marks.bulk.trash, "Move marked to Trash")
        end,
        trash = {
            -- Homebrew's `trash` (brew install trash); keg-only, so use its full path
            cmd = "/opt/homebrew/opt/trash/bin/trash",
        },
        view = { width = 32 },
        filters = { dotfiles = false },
        git = { enable = true, ignore = false },
        renderer = {
            group_empty = true,          -- show a/b/c as one line when folders only contain one folder
            highlight_git = true,        -- color file names by git status
            indent_markers = { enable = true },
        },
    },
}
