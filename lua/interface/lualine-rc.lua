local setup = require "setup"

setup("lualine", {
    options = {
        theme = "dracula",
        globalstatus = true,
        icons_enable = true,
        section_separators = {left = '', right = ''},
        component_separators = { left = " ", right = "" },
        statusline = 500,
    },
    sections = {
        lualine_a = {
            { "mode", icons_enable = true },
        },
        lualine_b = {
            { "branch" , icon = "שׂ"},
            { "diff", colored = false },
            { "diagnostics" ,
                sources = {"nvim_diagnostic"},
                colored = false
            }
        },
        lualine_c = {
            "filetype",
            { "filename", file_status = true, newfile_target = true,  path = 1, shorting_target = 40 } ,
        },
        lualine_x = {
            { "lsp_progress" ,
                spinner_symbols = { '', '',  '', '', '', '', '', '', '', '', '', ''},
            },
            "fileformat",
            "encoding",
            "filesize"
        }
    },
    extensions = {
        "quickfix", "nvim-tree", "symbols-outline"
    }
})

