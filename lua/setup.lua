local ok, symbols = pcall(require, "symbols-outline");
if ok then 
    symbols.setup()
end

local ok, startup = pcall(require, "startup")
if ok then 
    startup.setup {
        theme = "startify"
    }
end

vim.o.timeoutlen = 200
local ok, lightbulb = pcall(require, "nvim-lightbulb")
if ok then 
    lightbulb.setup {
        autocmd = { enable = true }
    }
end

local ok, lualine = pcall(require, "lualine")
if ok then 
    lualine.setup{
        options = { theme = "dracula", globalstatus = true },
        sections = {
            lualine_a ={
                { "mode", icons_enabled = true },
            },
            lualine_b = { "branch" , { "diagnostics" , sources = {"nvim_diagnostic", "coc"} }},
            lualine_c = { { "filename", file_status = true, newfile_target = true,  path = 1, shorting_target = 40 } } 
        }
    }
end

local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if ok then
    treesitter.setup {
        ensure_installed = { "html", "json", "json5", "python", "scss", "toml", "tsx", "typescript", "rust", "javascript", "go", "css", "cpp", "c", "bash" },
        ignore_install = { "phpdoc" },
        highlight = { enable = true},
        auto_install = true
    }
end

local ok, whick_key = pcall(require, "whick-key")
if ok then
    whick_key.setup{}
end

vim.cmd [[packadd packer.nvim]]

local ok, telescope =pcall(require, "telescope")
if ok then 
    telescope.setup {
        mappings = {
            i = { ["C-h"] = "whick_key" }
        },
        pickers = {
            find_files = require "telescope.themes".get_dropdown {
                layout_config = { preview_cutoff = 0 }
            }
        }
    }
end

local ok, auto_save =pcall(require, "auto-save")
if ok then
    auto_save.setup {
        execution_message = {
		    message = function() -- message to print on save
			    return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
		    end,
		    dim = 0.18, -- dim the color of `message`
		    -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
            cleaning_interval = 1250, 
	    },
        trigger_events = {"InsertLeave", "TextChanged"},
    }
end

local ok, indent = pcall(require, "indent_blankline")
if ok then 
    vim.opt.list = true
    -- vim.opt.listchars:append "space:⋅"
    -- vim.opt.listchars:append "eol:↴"
    indent.setup {
        space_char_blankline = " ",
        show_current_context = true,
        show_current_context_start = true,
    }
end
local ok, tree = pcall(require, "nvim-tree")
if ok then
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    tree.setup {
        sort_by = "case_sensitive",
        view = {
            adaptive_size = true,
            mappings = {
                list = {
                    { key = "u", action = "dir_up" },
                },
            },
        },
        renderer = {
            group_empty = true,
        },
        filters = {
            dotfiles = true,
        },
    }
end


local ok, mason = pcall(require, "mason")
if ok then
    mason.setup{
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        }
    }
end
