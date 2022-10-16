local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()
local ok, packer = pcall(require, "packer")
if not ok then
    ensure_packer() 
end

packer.startup({ function(use)

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
    use 'pocco81/auto-save.nvim'
end,
config = {
    display = {
        open_fn = require("packer.util").float,
        prompt_border = "rounded",
--        non_interactive = true
    },
    git = {
        default_url_format = "git@github.com:%s",
    },
    compile_path =  require "packer.util".join_paths(vim.fn.stdpath("config"), "packer_compiled.lua"),
    auto_reload_compiled = true,
    autoremove = true
    }
})

-- packer sync ------------------------------------------------------------------
local ok, packer_compiled =pcall(require, "../packer_compiled")
if not ok then 
    -- vim.cmd "PackerSync"
    packer.sync()
end

-- auto refresh
vim.cmd [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost manager.lua source <afile> | PackerCompile
]]
