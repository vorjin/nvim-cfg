vim.pack.add({
    "https://github.com/vimpostor/vim-tpipeline",
})

--- mini statusline (embedded in tmux via vim-tpipeline) ---
local MiniStatusline = require("mini.statusline")
MiniStatusline.setup({
    content = {
        active = function()
            local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
            local git           = MiniStatusline.section_git({ trunc_width = 40 })
            local filename      = MiniStatusline.section_filename({ trunc_width = 140 })

            local encoding      = vim.bo.fileencoding ~= "" and vim.bo.fileencoding or vim.o.encoding
            local fileinfo      = string.format("%s :: %s :: %s", encoding, vim.bo.fileformat, vim.bo.filetype)
            local location      = "%3p%% %l:%c"

            return MiniStatusline.combine_groups({
                { hl = mode_hl,                 strings = { mode } },
                { hl = "MiniStatuslineDevinfo", strings = { git } },
                "%<",
                { hl = "MiniStatuslineFilename", strings = { filename } },
                "%=",
                { hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
                { hl = mode_hl,                  strings = { location } },
            })
        end,
    },
})
