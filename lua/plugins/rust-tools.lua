return {
    {
        "simrat39/rust-tools.nvim",
        name = "rust-tools",
        opts = {
            -- executor = require("rust-tools.executors").termopen,
            inlay_hints = {
                auto = true,
                only_current_line = false,
                parameter_hints_prefix = "  ",
                other_hints_prefix = "  ",
            },
            hover_actions = {
                border = {
                    { "╭", "FloatBorder" },
                    { "─", "FloatBorder" },
                    { "╮", "FloatBorder" },
                    { "│", "FloatBorder" },
                    { "╯", "FloatBorder" },
                    { "─", "FloatBorder" },
                    { "╰", "FloatBorder" },
                    { "│", "FloatBorder" },
                },
                auto_focus = true,
            },
            server = {
                setting = {
                    ["rust-analyzer"] = { checkOnSave = { command = "clippy" } },
                },
                standalone = true,
            },
        },
        ft = { "rs" },
        keys = {
            {
                "<leader>cha",
                function()
                    require("rust-tools").hover_actions.hover_actions()
                end,
                desc = "RustHoverActions",
            },
            {
                "<leader>cex",
                function()
                    require("rust-tools").expand_macro.expand_macro()
                end,
                desc = "RustExpandMacro",
            },
            {
                "<leader>cx",
                function()
                    require("rust-tools").runnables.runnables()
                end,
                desc = "RustRun",
            },
        },
    },
}
