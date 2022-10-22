vim.o.timeoutlen = 200

local setup = require "setup"

setup("symbols-outline", {})
setup("which-key", {})

setup("startup", { theme = "startify" })
setup("nvim-lightbulb", { autocmd = { enable =true } })
setup("lualine", {
    options = {
        theme = "dracula",
        globalstatus = true,
        icons_enable = true,
        component_separators = { left = " ", right = "" },
    },
    sections = {
        lualine_b = {
            { "branch" , icon = ""},
            { "diagnostics" ,
                sources = {"nvim_diagnostic", "coc"},
                colored = false
            }
        },
        lualine_c = { { "filename", file_status = true, newfile_target = true,  path = 1, shorting_target = 40 } , "lsp_progress"}
    },
    extensions = {
        "quickfix", "nvim-tree", "symbols-outline"
    }
})

setup("nvim-treesitter.configs", {
    ensure_installed = { "html", "json", "json5", "python", "scss", "toml", "tsx", "typescript", "rust", "javascript", "go", "css", "cpp", "c", "bash" },
    ignore_install = { "phpdoc" },
    highlight = { enable = true},
    auto_install = true
})

setup("telescope", {
    pickers = {
        find_files = require "telescope.themes".get_dropdown {
            layout_config = { preview_cutoff = 0 }
        }
    }
})
setup("auto-save", {
    execution_message = {
        message = function() -- message to print on save
            -- vim.notify("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"), vim.log.levels.INFO)
            return  "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S")
        end,
        dim = 0.18, -- dim the color of `message`
        -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
        cleaning_interval = 1250,
    },
    trigger_events = {"InsertLeave", "TextChanged"},
})

vim.opt.list = true
setup("indent_blankline", {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
})


setup("mason", {
    ui = {
        border ="rounded",
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

setup("diffview", {
    view = {
        merge_tool = {
            layout = "diff3_mixed"
        }
    }
})

local ok, notify = setup("notify", {
    render = "default",
    icons = {
        ERROR = "",
        WARN = "",
        INFO = "",
        DEBUG = "",
        TRACE = "✎",
    },
})
if ok then
vim.notify = notify
end

