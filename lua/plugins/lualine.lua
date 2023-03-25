return {
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = {
            options = {
                theme = "auto",
                globalstatus = true,
                icons_enable = true,
                section_separators = { left = "", right = "" },
                component_separators = { left = " ", right = "" },
                statusline = 500,
            },
        },
    },
}
