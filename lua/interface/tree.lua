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
        icons = {
            glyphs = {
                folder = {
                    arrow_closed = ">"
                }
            }
        }
    },
    filters = {
        dotfiles = false,
        custom = { "^.git$" }
    },
})
if ok then
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
end
