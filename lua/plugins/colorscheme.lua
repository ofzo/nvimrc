return {
    {
        "olimorris/onedarkpro.nvim",
        -- disabled = true,
        opts = {
            colors = {
                onelight = {
                    black = "#000000",
                    gray = "#868686",
                    red = "#fd2231",
                    fg = "#000000",
                    bg = "#ffffff",
                    orange = "#aa7005",
                    yellow = "#cc8b0e",
                    purple = "#7e38e8",
                    green = "#128409",
                    cyan = "#1a99a9",
                    blue = "#1179cb",
                },
            },
            styles = {
                keywords = "bold,italic",
                comments = "italic",
                variables = "bold",
                functions = "bold,italic",
            },
            semantic_tokens = { -- Add/override semantic tokens
                default = {
                    ["@class"] = { fg = "${yellow}" },
                    ["@property"] = { fg = "${red}" },
                    ["@global"] = { fg = "${red}" },
                    ["@defaultLibrary"] = { fg = "${cyan}" },
                    ["@modifier"] = { fg = "${purple}" },
                    ["@type"] = { fg = "#7e38e8" },
                },
            },
        },
    },
    -- Configure LazyVim to load gruvbox
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "onelight",
        },
    },
}
