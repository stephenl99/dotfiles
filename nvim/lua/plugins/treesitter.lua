-- Syntax highlighting (and smarter indentation) via tree-sitter parsers.
-- Add languages to the list below; run :TSUpdate to update parsers.
-- Needs the tree-sitter CLI to build parsers: npm install -g tree-sitter-cli
-- (Homebrew's version compiles Rust from source on macOS 14 and takes forever.)
local languages = {
    "c", "cpp", "cmake", "make", "proto",   -- this project (C++, CMake, Makefile, gRPC .proto)
    "bash", "lua", "python", "markdown", "markdown_inline", "json", "yaml",
    "vim", "vimdoc", "query",
}

return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter").install(languages)

        -- turn on tree-sitter highlighting + indentation for any file with a parser
        vim.api.nvim_create_autocmd("FileType", {
            callback = function(args)
                if pcall(vim.treesitter.start, args.buf) then
                    vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end
            end,
        })
    end,
}
