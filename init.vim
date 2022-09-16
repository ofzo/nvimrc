"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"plugin config
" lua require('plugins')
lua require("setup")

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" themes
colorscheme onedarkpro
set background=light
let g:airline_theme="violet"

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
:nnoremap <space>e :CocCommand explorer<CR>
:nnoremap <space>. :CodeAction<CR>
:nnoremap <space>s :w<CR>
:nnoremap <space>w :x<CR>
:nnoremap <space>z :undo<CR>
:nnoremap <space>q :q<CR>
" find file
:nnoremap <space>f :Telescope find_files<CR>
" find buffer
:nnoremap <space>fb :Telescope buffers<CR>
" find text
:nnoremap <space>g :Telescope live_grep<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" colors
" hi Comment ctermfg=lightgray
" hi Keyword term=bold ctermfg=magenta
" hi Identifier ctermfg=yellow



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" starting

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" load other config
source $HOME/.config/nvim/action.vim
