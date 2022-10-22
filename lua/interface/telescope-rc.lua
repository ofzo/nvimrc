local setup = require"setup"

setup("telescope", {
    defaults = {
        prompt_prefix = " ",
    },
    pickers = {
        find_files = require "telescope.themes".get_dropdown {
            layout_config = { preview_cutoff = 0 }
        }
    }
})

