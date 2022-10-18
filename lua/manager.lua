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

local utils = require "packer.util"
local config_path  = vim.fn.stdpath("config")
packer.startup({ function(use)

    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- use 'github/copilot.vim'
    use 'ray-x/lsp_signature.nvim'
    use 'nvim-lualine/lualine.nvim'
    use 'arkav/lualine-lsp-progress'
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }
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
    -- use "williamboman/nvim-lsp-installer"
    use  { "weilbith/nvim-code-action-menu", cmd = "CodeAction"}
    use { "williamboman/mason.nvim" } -- lsp installer
    use 'ryanoasis/vim-devicons'
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
    use 'NvChad/nvim-colorizer.lua'
    use "lukas-reineke/indent-blankline.nvim"

    -- use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
end,
config = {
    display = {
        prompt_border = "double",
        open_fn = function () 
            local result , win, buf =utils.float {
                border = {
                    { '╭', 'FloatBorder' },
                    { '─', 'FloatBorder' },
                    { '╮', 'FloatBorder' },
                    { '│', 'FloatBorder' },
                    { '╯', 'FloatBorder' },
                    { '─', 'FloatBorder' },
                    { '╰', 'FloatBorder' },
                    { '│', 'FloatBorder' },
                }
            }
            vim.api.nvim_win_set_option(win, "winhighlight", "NormalFloat:Normal")
            return result, win, buf
        end,
     -- non_interactive = true
    },
    -- git = {
    --     default_url_format = "git@github.com:%s",
    -- },
    compile_path = utils.join_paths(config_path .. "/lua/packer_compiled.lua"),
    auto_reload_compiled = true,
    autoremove = true
}
})

-- packer sync ------------------------------------------------------------------
local __dirname = ...
local ok, packer_compiled =pcall(require, "packer_compiled")
if not ok then 
    packer.sync()
end

-- auto refresh
vim.cmd [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost manager.lua source <afile> | PackerCompile
]]
