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

local ok, lsp_signature = pcall(require, "lsp_signature")
if ok then 
    lsp_signature.setup {
        bind = true,
        handler_opts = { border = "rounded" }
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

local ok, lspconfig = pcall(require, "lspconfig")
if ok then
    lspconfig.rust_analyzer.setup{}
    lspconfig.tsserver.setup{}
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
            find_files = { theme = "dropdown" }
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
