return { -- change some telescope options and a keymap to browse plugin files
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-telescope/telescope-file-browser.nvim", "nvim-lua/plenary.nvim" },
        keys = {
            -- add a keymap to browse plugin files
            -- stylua: ignore
            {
                "<leader>fp",
                function() require("telescope.builtin").find_files() end,
                desc = "File Finder",
            },
            {
                "<leader>sb",
                function()
                    require("telescope.builtin").live_grep({ grep_open_files = true })
                end,
                desc = "Find Text in open files",
            },
            {
                "<leader>sa",
                function()
                    require("telescope.builtin").live_grep()
                end,
                desc = "Find Text",
            },
        },
        -- change some options
        opts = {
            defaults = {
                layout_strategy = "horizontal",
                layout_config = { prompt_position = "bottom", preview_width = 0.65 },
                sorting_strategy = "ascending",
                winblend = 10,
            },
            pickers = {
                find_files = {
                    prompt_prefix = "Find File >",
                    layout_config = { prompt_position = "top" },
                    previewer = false,
                },
                live_grep = {},
            },
            extensions = {
                file_browser = {
                    theme = "ivy",
                    collapse_dirs = true,
                    git_status = true,
                    display_stat = { date = true, size = true },
                    depth = 1,
                },
            },
        },
        config = function()
            require("telescope").load_extension("file_browser")
        end,
    },

    -- add telescope-fzf-native
    {
        "telescope.nvim",
        dependencies = {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            config = function()
                require("telescope").load_extension("fzf")
            end,
        },
    },
}
