---- mini notify ----
require("mini.notify").setup({
    -- only show msgs
    content = {
        format = function(notif)
            return notif.msg
        end,
    },
})
