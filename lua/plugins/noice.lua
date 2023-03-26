return {
    "folke/noice.nvim",
    -- enabled = false,
    opts = {
        cmdline = {
            enabled = false,
            view = "cmdline",
            format = {
                cmdline = { icon = "$ " },
                search_down = { icon = "🔍⌄" },
                search_up = { icon = "🔍⌃" },
                filter = { icon = "$" },
                lua = { icon = "☾" },
                help = { icon = "?" },
            },
        },
        messages = {
            enabled = false,
        },
        notify = {
            -- enabled = false,
            view = "mini",
        },
    },
}
