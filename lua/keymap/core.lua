
function setup(mapx)
    -- mapx.group({prefix = "<Space>c"}, "Editor", function() 

        nnoremap("<Space>s", ":w<CR>", "Save")
        nnoremap("<Space>w", ":x<CR>", "Write and Close")
        nnoremap("<Space>z", ":undo<CR>", "Undo")
        nnoremap("<Space>r", ":redo<CR>", "Redo")
        nnoremap("<Space>.", function() vim.cmd "CodeAction" end, "CodeAction")
        nnoremap("<Space>\\", function()  vim.cmd "SymbolsOutline" end, "SymbolsOutline")
        nnoremap("<ESC><ESC>", function() vim.cmd "set nohlsearch" end, "Cancel Hightlight")

        -- end)
end

return setup
