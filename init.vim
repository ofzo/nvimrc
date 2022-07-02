"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"plugin config
lua require('plugins')

call plug#begin("~/.config/nvim/plugged")
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Yggdroot/indentLine'
Plug 'mhinz/vim-startify'
Plug 'yonchu/accelerated-smooth-scroll'
Plug 'puremourning/vimspector'
Plug 'scrooloose/nerdcommenter'
Plug 'haystackandroid/carbonized'
Plug 'tpope/vim-surround'
Plug 'RishabhRD/popfix'
Plug 'RishabhRD/nvim-lsputils'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'kosayoda/nvim-lightbulb'
Plug 'mhinz/vim-startify'
" Plug "nvim-treesitter/nvim-treesitter"
" Plug "SmiteshP/nvim-gps"
Plug 'simrat39/rust-tools.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'BurntSushi/ripgrep'
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'PhilRunninger/nerdtree-visual-selection'
"""""""""" themes
Plug 'drewtempelmeyer/palenight.vim'
""""""""""

call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" themes
colorscheme palenight
set background=dark
let g:lightline = { 'colorscheme': 'palenight' }


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
set mouse
set clipboard=unnamed
filetype plugin indent on



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" config
let g:airline#extensions#tabline#enable = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
let g:NERDTreeWinSize = 40
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.DS_Store', '\.vscode']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader='\'
" keymapping
map <C-e> :NERDTreeToggle<CR>
:nnoremap <space>e :NERDTreeToggle<CR>
:nnoremap <space>. :CodeAction<CR>
:nnoremap <space>s :w<CR>
:nnoremap <space>w :x<CR>
:nnoremap <space>z :undo<CR>
:nnoremap <space>q :q<CR>
" find file
:nnoremap <space>f :Telescope find_files<CR>
" find buffer
:nnoremap <space>fb :Telescope buffers<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" colors
hi Comment ctermfg=lightgray
hi Keyword term=bold ctermfg=magenta
hi Identifier ctermfg=yellow



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" starting
autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" load other config
source $HOME/.config/nvim/action.vim
