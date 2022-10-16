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

local ok, packer = pcall(require, "packer")
if ok then
packer.startup({ function()

	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
    -- use 'github/copilot.vim'
    use 'ray-x/lsp_signature.nvim'
    use 'nvim-lualine/lualine.nvim'
    use { 
        'neoclide/coc.nvim',
        branch = 'release'
    }
    -- use 'mhinz/vim-startify'
    use { 
        'startup-nvim/startup.nvim',
        requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
   }
    use 'yonchu/accelerated-smooth-scroll'
    use 'RishabhRD/nvim-lsputils'
    use 'junegunn/fzf'
    use { 
        'kosayoda/nvim-lightbulb',
        requires = 'antoinemadec/FixCursorHold.nvim'
    }
    use 'simrat39/rust-tools.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
    use 'BurntSushi/ripgrep'
    use 'neovim/nvim-lspconfig'
    use { "williamboman/mason.nvim" }
    use 'ryanoasis/vim-devicons'
    use {
        'weilbith/nvim-code-action-menu',
        after="coc.nvim",
        requires = "xiyaowong/coc-code-action-menu.nvim",
        config = function()
            require "coc-code-action-menu"
        end,
        -- cmd="CodeAction"
    }
    use "olimorris/onedarkpro.nvim"
    use 'simrat39/symbols-outline.nvim'
    use {
        'saecki/crates.nvim',
        event = { "BufRead Cargo.toml" },
        requires = { { 'nvim-lua/plenary.nvim' } },
        config = function()
            require('crates').setup()
        end,
    }
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    use "folke/which-key.nvim"
    use "b0o/mapx.nvim"
    use {
        'pocco81/auto-save.nvim',
	    config = function()
		    require("auto-save").setup {
                execution_message = {
		            message = function() -- message to print on save
			            return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
		            end,
		            dim = 0.18, -- dim the color of `message`
		            cleaning_interval = 1250, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
	            },
                trigger_events = {"InsertLeave", "TextChanged"},
		    }
	    end,
    }
end,
config = {
    display = {
        open_fn = require("packer.util").float,
        prompt_border = "rounded"
    },
    default_url_format = "git@github.com:s%",
    compile_path = vim.fn.stdpath "config" .. "/lua/packer_compiled.lua"
}})
end
