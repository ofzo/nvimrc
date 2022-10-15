"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"plugin config
lua require("setup")
source $HOME/.config/nvim/keymap.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" themes
" colorscheme onedarkpro
set background=light

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" setting
set encoding=UTF-8
set hlsearch
set number
set autoindent
set cursorline
set nofoldenable
set foldmethod=syntax
set cul
set helplang=cn
set cindent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=0
set smarttab
set wildmenu
set wildmode=list:longest,full
set mouse=a
set clipboard=unnamed
set signcolumn=yes
set updatetime=300
filetype plugin indent on

set nobackup
set noswapfile
set nowritebackup

set laststatus=3
set foldexpr=nvim_treesitter#foldexpr()
