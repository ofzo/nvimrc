

require 'lspconfig'.rust_analyzer.setup{}
require 'lspconfig'.tsserver.setup{}
-- require ("nvim-gps").setup()

-- local saga = require 'lspsaga'
-- saga.init_lsp_saga()

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()

	    -- Packer can manage itself
	    use 'wbthomason/packer.nvim'
        use 'neovim/nvim-lspconfig'
        use 'github/copilot.vim'
        use 'neovim/nvim-lspconfig'

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

--        use {
--                "SmiteshP/nvim-gps",
--                requires = "nvim-treesitter/nvim-treesitter"
--        }

end)


