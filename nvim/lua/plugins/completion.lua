-- Autocomplete popup (fed by clangd and other language servers)
--   Ctrl-Space  open the menu      Ctrl-n / Ctrl-p (or arrows)  move
--   Enter       accept             Ctrl-e                      close
return {
    "saghen/blink.cmp",
    version = "1.*", -- release builds come with a prebuilt fast matcher
    event = { "InsertEnter", "CmdlineEnter" },
    opts = {
        keymap = { preset = "enter" },
        appearance = { nerd_font_variant = "mono" },
        completion = {
            documentation = { auto_show = true, auto_show_delay_ms = 300 },
            menu = { border = "rounded" },
        },
        signature = { enabled = true }, -- show function parameters while typing a call
        sources = { default = { "lsp", "path", "buffer" } },
    },
}
