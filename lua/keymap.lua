--------------------------------------------------------------------
vim.g.mapleader = "\\"
-- nnoremapping
local ok, mapx = pcall(require, "mapx")
if ok then
    mapx.setup { global = true , whichkey = true }
end

nnoremap("<space>e", ":CocCommand explorer<CR>")
nnoremap("<space>.", ":CodeAction<CR>", "")
nnoremap("<space>\\", ":SymbolsOutline<CR>")

nnoremap("<space>s", ":w<CR>")
nnoremap("<space>w", ":x<CR>")
nmap("<C-z>", ":undo<CR>")
nmap("<C-r>", ":redo<CR>")

nnoremap("<space>q", ":q<CR>")

nnoremap("<space>f", ":Telescope find_files<CR>")
-- find text
nnoremap("<space>g", "Telescope live_grep<CR>")


--------------------------------------------------------------------
inoremap("<CR>", 
    [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], 
    "silent", "expr")
nnoremap("ga", "<CMD>lua vim.lsp.buf.code_action()<CR>", "silent" )

vim.api.nvim_create_augroup("CocGroup", { clear = true })
vim.api.nvim_create_autocmd("CursorHold", {
    group = "CocGroup",
    command = "lua vim.diagnostic.open_float(nil, { focusable = false })",
    desc = "Highlight symbol under cursor on CursorHold"
})

nnoremap("g[", "<CMD>lua vim.diagnostic.goto_prev()<CR>", "silent")
nnoremap("g]", "<CMD>lua vim.diagnostic.goto_next()<CR>", "silent" )
-- autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 200)
