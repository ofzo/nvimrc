
require 'lspconfig'.rust_analyzer.setup{}
require 'lspconfig'.tsserver.setup{}
require('lualine').setup()
require 'onedarkpro' .setup({
    light_theme = "onelight",
    colors = {
        onelight = {
            black = "#000000",
            gray = "#868686",
            red = "#fd2231",
            fg = "#000000",
            bg = "#fafafa",
            orange = "#aa7005",
            yellow = "#cc8b0e",
            purple = "#7e38e8",
            green = "#128409",
            cyan = "#1a99a9",
            blue = "#1179cb",
            float_bg = "#444555",
            selection_bg = "#000000",
            virtual_text_hint = "#555555"
        }
    },
    styles = {
        keywords = "bold,italic",
        comments = "italic",
        variables = "bold",
        functions = "bold,italic"
    },
    options = {
        bold = true
    }
})
require "symbols-outline" .setup({})
require"startup".setup({ theme = "startify" })
vim.o.timeoutlen = 200
require 'key-menu' .set('n', '<Space>')
require 'nvim-lightbulb'.setup({ autocmd = { enable = tru } })
-- require ("nvim-gps").setup()
require 'lsp_signature' .setup({
    bind = true,
    handler_opts = {
        border = "rounded"
    }
}) 
-- local saga = require 'lspsaga'
-- saga.init_lsp_saga()

vim.cmd [[packadd packer.nvim]]

return require('packer').startup({ function()

	 -- Packer can manage itself
	use 'wbthomason/packer.nvim'
    -- use 'github/copilot.vim'
    use 'ray-x/lsp_signature.nvim'
    use 'nvim-lualine/lualine.nvim'
	-- use 'vim-airline/vim-airline-themes'
    use 'linty-org/key-menu.nvim'
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
    use 'scrooloose/nerdcommenter'
    use 'tpope/vim-surround'
    use 'RishabhRD/popfix'
    use 'RishabhRD/nvim-lsputils'
    use  {
        'junegunn/fzf'
    }
    use { 
        'kosayoda/nvim-lightbulb',
        requires = 'antoinemadec/FixCursorHold.nvim'
    }
    use 'simrat39/rust-tools.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'

    use 'BurntSushi/ripgrep'
    use 'neovim/nvim-lspconfig'
    use 'ryanoasis/vim-devicons'

    use {
	    'kyazdani42/nvim-tree.lua',
    	requires = {
  			'kyazdani42/nvim-web-devicons', -- optional, for file icon
 	    }
    }

    use {
        'weilbith/nvim-code-action-menu',
        after="coc.nvim",
        requires = "xiyaowong/coc-code-action-menu.nvim",
        config = function()
            require "coc-code-action-menu"
        end,
        -- cmd="CodeAction"
    }
    use "roadupcc/onedarkpro.nvim"
    use 'simrat39/symbols-outline.nvim'
    use {
        'saecki/crates.nvim',
        event = { "BufRead Cargo.toml" },
        requires = { { 'nvim-lua/plenary.nvim' } },
        config = function()
            require('crates').setup()
        end,
    }
end,
config = {
    display = {
        open_fn = require("packer.util").float    
    },
    default_url_format = "git@github.com:s%"
}})


