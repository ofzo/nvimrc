
local setup = require"setup"

setup("onedarkpro", function (onedarkpro)
local color = require "onedarkpro.lib.color"
onedarkpro.setup{
    light_theme = "onelight",
    colors = {
        onedark = {
            telescope_prompt =color.lighten(onedarkpro.get_colors("onedark").bg, 0.97),
            telescope_results =color.darken (onedarkpro.get_colors("onedark").bg, 0.85)
        },
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
            telescope_prompt =  color.lighten(onedarkpro.get_colors("onelight").bg, 0.98),
            telescope_results = color.darken(onedarkpro.get_colors("onelight").bg, 0.95)
        },
    },
    styles = {
        keywords = "bold,italic",
        comments = "italic",
        -- variables = "bold",
        functions = "bold,italic"
    },
    highlights = {
        Pmenu = {
            bg = "#ffffff",
            fg = "#ff0000"
        },
        PmenuSel = {
            bg = "#00ff00",
            fg = "#ffffff"
        },

        -- TelescopeBorder = {
        --     fg = "${telescope_results}",
        --     bg = "${telescope_results}",
        -- },
        -- TelescopePromptBorder = {
        --     fg = "${telescope_prompt}",
        --     bg = "${telescope_prompt}",
        -- },
        TelescopePromptCounter = { fg = "${fg}" },
        TelescopePromptNormal = { fg = "${fg}", bg = "${telescope_prompt}" },
        TelescopePromptPrefix = {
            fg = "${purple}",
            bg = "${telescope_prompt}",
        },
        TelescopePromptTitle = {
            fg = "${telescope_prompt}",
            bg = "${purple}",
        },
        TelescopePreviewTitle = {
            fg = "${telescope_results}",
            bg = "${green}",
        },
        TelescopeResultsTitle = {
            fg = "${telescope_results}",
            bg = "${telescope_results}",
        },
        TelescopeMatching = { fg = "${purple}" },
        TelescopeNormal = { bg = "${telescope_results}" },
        TelescopeSelection = { bg = "${telescope_prompt}" },
    }
}
vim.cmd("colorscheme onedarkpro")
end)
