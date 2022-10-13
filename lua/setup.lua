require 'onedarkpro' .setup({
    light_theme = "onelight",
    colors = {
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
            blue = "#1179cb"
        }
    },
    styles = {
        keywords = "bold,italic",
        comments = "italic",
        variables = "bold",
        functions = "bold,italic"
    },
    highlights = {
        Pmenu = {
            bg = "#555555",
            fg = "#ff0000"
        },
        PmenuSel = {
            bg = "#00ff00",
            fg = "#ffffff"
        }
    },
    options = {
        bold = true
    }
})
require "symbols-outline".setup{}
require "startup".setup{ theme = "startify" }
vim.o.timeoutlen = 200
require 'nvim-lightbulb'.setup{ autocmd = { enable = tru } }
-- require ("nvim-gps").setup()
require 'lsp_signature' .setup({
    bind = true,
    handler_opts = {
        border = "rounded"
    }
}) 
require 'lualine' .setup({
    options = {
        theme = 'dracula',
    } 
})

vim.cmd [[packadd packer.nvim]]

require 'lspconfig'.rust_analyzer.setup{}
require 'lspconfig'.tsserver.setup{}

return require('packer').startup({ function()

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
        open_fn = require("packer.util").float    
    },
    default_url_format = "git@github.com:s%"
}})


