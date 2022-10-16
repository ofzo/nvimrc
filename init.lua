-------------------------------------------------------------------
require "setup"
require "keymap"
require "theme"
--------------------------------------------------------------------
vim.cmd "set background=light"
--------------------------------------------------------------------

vim.cmd "set encoding=UTF-8"
vim.cmd "set hlsearch"
vim.cmd "set number"
vim.cmd "set autoindent"
vim.cmd "set cursorline"
vim.cmd "set nofoldenable"
vim.cmd "set foldmethod=syntax"
vim.cmd "set cul"
vim.cmd "set helplang=cn"
vim.cmd "set cindent"
vim.cmd "set expandtab"
vim.cmd "set tabstop=4"
vim.cmd "set shiftwidth=4"
vim.cmd "set softtabstop=0"
vim.cmd "set smarttab"
vim.cmd "set wildmenu"
vim.cmd "set wildmode=list:longest,full"
vim.cmd "set mouse=a"
vim.cmd "set clipboard=unnamed"
vim.cmd "set signcolumn=yes"
vim.cmd "set updatetime=300"
vim.cmd "filetype plugin indent on"

vim.cmd "set nobackup"
vim.cmd "set noswapfile"
vim.cmd "set nowritebackup"

vim.cmd "set laststatus=3"
vim.cmd "set foldexpr=nvim_treesitter#foldexpr()"


-- packer sync ------------------------------------------------------------------
local ok, packer_compiled =pcall(require, "packer_compiled")
if not ok then 
    vim.cmd "PackerSync"
end
