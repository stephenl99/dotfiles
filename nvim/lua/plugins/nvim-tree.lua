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
        -- keep nvim-tree's default keys, but free up Ctrl-k (it's "file info" by default)
        -- so Ctrl-h/j/k/l window navigation works inside the tree too
        on_attach = function(bufnr)
            local api = require("nvim-tree.api")
            api.config.mappings.default_on_attach(bufnr)
            vim.keymap.del("n", "<C-k>", { buffer = bufnr })
        end,
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
