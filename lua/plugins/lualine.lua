return { -- the opts function can also be used to change the default opts:
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = function(_, opts)
            table.insert(opts.sections.lualine_x, "😄")
        end,
    },

    -- or you can return new options to override all the defaults
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = {
            options = {
                theme = "dracula",
                globalstatus = true,
                icons_enable = true,
                section_separators = { left = "", right = "" },
                component_separators = { left = " ", right = "" },
                statusline = 500,
            },
        },
    },
}
