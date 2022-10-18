function setup(mapx)
    local prefix = "<Space>l"
    mapx.name(prefix, "LSP")

    mapx.group("silent", {}, function()
        nnoremap(prefix.."r", ":LspRestart<CR>", "LspRestart") 
        -- nnoremap(prefix.."i", "MasonInstall<CR>", "Lsp Install")
    end)
end

return setup

