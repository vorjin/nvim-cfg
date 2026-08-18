--- mini completions ---
local MiniCompletion = require("mini.completion")
MiniCompletion.setup({
    lsp_completion = {
        auto_setup = true,
    }
})

vim.keymap.set("i", "<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true, desc = "Next completion item / Tab" })
vim.keymap.set("i", "<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]],
    { expr = true, desc = "Previous completion item / Shift-Tab" })

