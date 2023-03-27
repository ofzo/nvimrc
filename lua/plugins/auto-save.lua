return {
    {
        "pocco81/auto-save.nvim",
        enabled = false,
        event = "VeryLazy",
        lazy = true,
        opt = {
            trigger_events = { "InsertLeave" },
            options = {
                trigger_events = { "InsertLeave" },
                debounce_delay = 1000,
            },
        },
    },
}
