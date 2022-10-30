
return function(mapx)
    -- mapx.group({prefix = "<Space>c"}, "Editor", function() 

        mapx.nnoremap("<Space>e", ":NvimTreeToggle<CR>", "silent", "File Explorer Toggle")
        mapx.nnoremap("<Space>s", ":w<CR>", "Save")
        mapx.nnoremap("<Space>q", ":q<CR>", "Quit")
        mapx.nnoremap("<Space>t", ":tabnew<CR>", "silent", "New Tab")
        mapx.nnoremap("<Space>w", ":x<CR>", "silent", "Write and Close")
        mapx.nnoremap("<Space>z", ":undo<CR>","silent", "Undo")
        mapx.nnoremap("<Space>r", ":redo<CR>","silent", "Redo")
        mapx.nnoremap("<Space>.", function() vim.cmd "CodeAction" end, "Code Action")
        mapx.nnoremap("<Space>\\", function()  vim.cmd "SymbolsOutline" end, "Symbols Outline")
        mapx.nnoremap("<ESC><ESC>", function()
            if vim.opt.hlsearch == true then
                vim.cmd "set hlsearch"
            else
                vim.cmd "set nohlsearch"
            end
        end, "Cancel Hightlight")
        -- mapx.nmap("/", function() vim.cmd "set hlsearch" end, "Cancel Hightlight")
        -- mapx.nmap(":", function() vim.cmd "set hlsearch" end, "Cancel Hightlight")

        mapx.nnoremap("<C-j>", ":m+1<CR>", "Move down")
        mapx.nnoremap("<C-k>", ":m-2<CR>", "Move up")
        mapx.inoremap("<C-j>", "<ESC>:m+1<CR>", "Move down")
        mapx.inoremap("<C-k>", "<ESC>:m-2<CR>", "Move up")
        mapx.nnoremap("<C-S-j>", ":t.<CR>", "Duplicate line")
        mapx.inoremap("<C-S-j>", "<ESC>:t.<CR>", "Duplicate line")

        mapx.inoremap("<C-Enter>", "<ESC>o", "silent")
        mapx.inoremap("<C-S-Enter>", "<ESC>O", "silent")

        mapx.vnoremap("<TAB>", ":><CR>", "silent", "add indent")
        mapx.nnoremap("<TAB>", ":><CR>", "silent", "add indent")

        mapx.vnoremap("<S-TAB>", ":<<CR>", "silent", "decrease indent")
        mapx.inoremap("<S-TAB>", ":<<CR>", "silent", "decrease indent")
        mapx.nnoremap("<S-TAB>", ":<<CR>", "silent", "decrease indent")

        mapx.vnoremap("i", "<ESC>", "silent")

end
