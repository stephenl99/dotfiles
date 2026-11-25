-- Ctrl-h/j/k/l moves between nvim windows AND tmux panes seamlessly
-- (the tmux half of this lives in ~/.tmux.conf)
return {
    "christoomey/vim-tmux-navigator",
    cmd = {
        "TmuxNavigateLeft",
        "TmuxNavigateDown",
        "TmuxNavigateUp",
        "TmuxNavigateRight",
        "TmuxNavigatePrevious",
    },
    keys = {
        { "<C-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Window/pane left" },
        { "<C-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Window/pane down" },
        { "<C-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Window/pane up" },
        { "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Window/pane right" },
    },
}
