-- mapgroup git

return function(mapx)
    local prefix = "<Space>g"
    mapx.name(prefix, "Git")

    mapx.group("silent", {}, function()
        mapx.nnoremap(prefix.."f", function() vim.cmd "DiffviewOpen" end, "open diff view")
        mapx.nnoremap(prefix.."h", function() vim.cmd "DiffviewFileHistory %" end, "Show history for current file")

        -- nnoremap(prefix.."l", function() vim.cmd end)
    end)
end

