local set = vim.opt
-- options ------------------------------------------------------------------
set.background = "light"
set.encoding = "UTF-8"
set.hlsearch = true
set.number =true
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
vim.cmd "filetype plugin indent on"

set.backup = false
set.swapfile = false
set.writebackup = false

set.laststatus=3
set.foldexpr="nvim_treesitter#foldexpr()"

-- require -----------------------------------------------------------------
require "manager"
require "setup"
require "keymap"
require "theme"

