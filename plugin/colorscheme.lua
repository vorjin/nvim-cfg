vim.pack.add({
    { src = "https://github.com/rose-pine/neovim",       name = "rose-pine" },
    { src = "https://github.com/EdenEast/nightfox.nvim", name = "nightfox" },
})

--- rose-pine theme ---
require("rose-pine").setup()

--- nightfox pine theme ---
require("nightfox").setup()
vim.cmd("colorscheme dayfox")
