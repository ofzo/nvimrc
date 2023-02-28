return {
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = {
            options = {
                theme = "ayu_light",
                globalstatus = true,
                icons_enable = true,
                section_separators = { left = "", right = "" },
                component_separators = { left = " ", right = "" },
                statusline = 500,
            },
        },
    },
}
