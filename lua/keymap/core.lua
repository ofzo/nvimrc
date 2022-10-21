
return function(mapx)
    -- mapx.group({prefix = "<Space>c"}, "Editor", function() 

        mapx.nnoremap("<Space>e", ":NvimTreeToggle<CR>", "silent", "File Explorer Toggle")
        mapx.nnoremap("<Space>s", ":w<CR>", "Save")
        mapx.nnoremap("<Space>t", ":tabnew<CR>", "silent", "New Tab")
        mapx.nnoremap("<Space>w", ":x<CR>", "silent", "Write and Close")
        mapx.nnoremap("<Space>z", ":undo<CR>","silent", "Undo")
        mapx.nnoremap("<Space>r", ":redo<CR>","silent", "Redo")
        mapx.nnoremap("<Space>.", function() vim.cmd "CodeAction" end, "Code Action")
        mapx.nnoremap("<Space>\\", function()  vim.cmd "SymbolsOutline" end, "Symbols Outline")
        mapx.nnoremap("<ESC><ESC>", function() vim.cmd "set nohlsearch" end, "Cancel Hightlight")

    -- end)
end
