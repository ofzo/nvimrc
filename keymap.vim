""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader='\'
" keymapping
nnoremap <space>e :CocCommand explorer<CR>
nnoremap <space>. :CodeAction<CR>
nnoremap <space>\ :SymbolsOutline<CR>
nnoremap <space>s :w<CR>
nnoremap <space>w :x<CR>
noremap <C-z> <cmd>:undo<CR>
noremap <C-r> <cmd>:redo<CR>
nnoremap <space>q :q<CR>


" find file
nnoremap <space>f :Telescope find_files<CR>
" find text
nnoremap <space>g :Telescope live_grep<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>


autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
nnoremap <silent> g[ <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap <silent> g] <cmd>lua vim.diagnostic.goto_next()<CR>

autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 200)
