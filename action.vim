nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>

set updatetime=300
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
nnoremap <silent> g[ <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap <silent> g] <cmd>lua vim.diagnostic.goto_next()<CR>

set signcolumn=yes

autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 200)
