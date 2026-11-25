-- Claude Code integration
return {
    "coder/claudecode.nvim",
    dependencies = {
        "folke/snacks.nvim",
    },
    config = true,
    cmd = {
        "ClaudeCode",
        "ClaudeCodeFocus",
        "ClaudeCodeAdd",
        "ClaudeCodeSend",
        "ClaudeCodeDiffAccept",
        "ClaudeCodeDiffDeny",
    },
    keys = {
        { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
        { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
        { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current file" },
        { "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
    },
}
