-- Editor settings

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Indentation: 4 spaces
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- 24-bit color (needed by bufferline; use iTerm2, Terminal.app on macOS 14 can't show it)
vim.opt.termguicolors = true

-- System clipboard
vim.opt.clipboard = "unnamedplus"

-- Mouse support
vim.opt.mouse = "a"

-- Turn off the built-in netrw file browser (nvim-tree replaces it).
-- This has to run before plugins load.
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
