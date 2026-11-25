-- Color scheme: Catppuccin Mocha (matches the iTerm2 "Dark (Catppuccin)" profile)
return {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000, -- load before everything else so other plugins pick up its colors
    opts = {
        flavour = "mocha",
        integrations = {
            nvim_tree = true,
            treesitter = true,
            native_lsp = { enabled = true },
            blink_cmp = true,
            gitsigns = true,
            diffview = true,
        },
    },
    config = function(_, opts)
        require("catppuccin").setup(opts)
        vim.cmd.colorscheme("catppuccin")
    end,
}
