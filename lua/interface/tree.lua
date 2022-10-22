local setup = require "setup"

local ok = setup("nvim-tree", {
    sort_by = "case_sensitive",
    open_on_setup = true,
    root_dirs = {},
    view = {
        adaptive_size = true,
        hide_root_folder = true,
    },
    renderer = {
        group_empty = true,
        highlight_opened_files = "all",
        icons = {
            glyphs = {
                folder = {
                    arrow_closed = "",
                    arrow_open = ""
                }
            }
        }
    },
    filters = {
        dotfiles = false,
        custom = { "^.git$" }
    },
    trash = {
        cmd = "gio trash",
        require_confirm = true,
    },
})
if ok then
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
end
