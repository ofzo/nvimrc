local set = vim.opt
-- options ------------------------------------------------------------------
set.background = "light"
set.encoding = "UTF-8"
set.hlsearch = true
set.number =true
set.relativenumber =true
set.scrolloff = 5
set.autoindent = true
set.cursorline = true
set.foldenable = false
set.foldmethod="syntax"
set.cul = true
set.helplang="cn"
set.cindent = true
set.expandtab = true
set.tabstop=4
set.shiftwidth=4
set.softtabstop=0
set.smarttab = true
set.wildmenu =true
set.wildmode="list:longest,full"
set.mouse="a"
set.clipboard="unnamed"
set.signcolumn="yes"
set.updatetime=300
set.backup = false
set.swapfile = false
set.writebackup = false
vim.g.termguicolors = true
set.laststatus=3
set.foldexpr="nvim_treesitter#foldexpr()"

vim.g.registers_window_border = "rounded"
-- require -----------------------------------------------------------------
require "plugins"
require "keymap"
require "init"

vim.cmd "filetype plugin indent on"
vim.cmd [[packadd packer.nvim]]
vim.cmd [[ autocmd ColorScheme * highlight NormalFloat guibg=white ]]
vim.cmd [[ autocmd ColorScheme * highlight FloatBorder guifg=black guibg=white ]]

