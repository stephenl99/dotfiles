-- Plugin manager (lazy.nvim)
-- Each file in lua/plugins/ returns a plugin spec and is loaded automatically.

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        { import = "plugins" },
    },
})
