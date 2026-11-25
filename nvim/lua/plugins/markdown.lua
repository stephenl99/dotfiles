-- Render markdown nicely inside nvim (headings, tables, code blocks, checkboxes).
-- The line under the cursor shows raw markdown so you can still edit it.
return {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    ft = { "markdown" },
    keys = {
        { "<leader>m", "<cmd>RenderMarkdown toggle<cr>", desc = "Toggle markdown rendering" },
    },
    opts = {
        code = { width = "block", left_pad = 1, right_pad = 1 }, -- code background fits the code
        heading = { width = "block", right_pad = 2 },
    },
}
