"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"plugin config
lua require('plugins')

call plug#begin("~/.config/nvim/plugged")

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
set wildmenu
set wildmode=list:longest,full

filetype plugin indent on 



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" config
let g:airline#extensions#tabline#enable = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" keymapping
:nnoremap <space>e :CocCommand explorer<CR>
:nnoremap <space>. :CodeAction<CR>
:nnoremap <space>s :w<CR>
:nnoremap <space>w :w<CR>
:nnoremap <space>z :undo<CR>
:nnoremap <space>q :q<CR>
" find file
:nnoremap <space>ff :Telescope find_files<CR> 
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


