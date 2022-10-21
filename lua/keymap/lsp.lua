return function(mapx)
    local prefix = "<Space>l"
    mapx.name(prefix, "LSP")

    mapx.group("silent", {}, function()
        mapx.nnoremap(prefix.."r", ":LspRestart<CR>", "LspRestart")
        mapx.nnoremap(prefix.."f", function() vim.lsp.buf.format{ async = true } end , "Format Code")
        -- nnoremap(prefix.."i", "MasonInstall<CR>", "Lsp Install")
    end)
end

