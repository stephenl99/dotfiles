-- Language servers ("IntelliSense"): go to definition, hover docs, rename, errors as you type.
-- C/C++ uses clangd (ships with Xcode). nvim-lspconfig supplies ready-made server configs.
return {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = { "saghen/blink.cmp" },
    config = function()
        -- tell servers what the completion plugin can do
        vim.lsp.config("*", {
            capabilities = require("blink.cmp").get_lsp_capabilities(),
        })

        vim.lsp.config("clangd", {
            cmd = {
                "clangd",
                "--background-index",      -- index the whole project for fast find-references
                "--clang-tidy",            -- extra lint warnings
                "--header-insertion=never", -- don't auto-add #includes when completing
            },
        })
        vim.lsp.enable("clangd")

        -- show errors inline at the end of the line
        vim.diagnostic.config({
            virtual_text = { prefix = "●" },
            severity_sort = true,
            float = { border = "rounded" },
        })

        -- keys that only exist while a language server is attached
        -- (nvim also provides these by default: K hover, grn rename, gra code action,
        --  grr references, gri implementation, [d / ]d previous/next error)
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                local map = function(lhs, rhs, desc)
                    vim.keymap.set("n", lhs, rhs, { buffer = args.buf, desc = desc })
                end
                map("gd", vim.lsp.buf.definition, "Go to definition")
                map("gD", vim.lsp.buf.declaration, "Go to declaration")
                map("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
                map("<leader>ca", vim.lsp.buf.code_action, "Code action / quick fix")
                map("<leader>d", vim.diagnostic.open_float, "Show error under cursor")
                map("<leader>h", "<cmd>LspClangdSwitchSourceHeader<cr>", "Switch .cpp <-> .hpp")
            end,
        })
    end,
}
