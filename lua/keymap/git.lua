-- mapgroup git

function setup(mapx)
    local prefix = "<Space>g"
    mapx.name(prefix, "Git")

    mapx.group("silent", {}, function()
        nnoremap(prefix.."f", function() vim.cmd "DiffviewOpen" end, "open diff view")
        nnoremap(prefix.."h", function() vim.cmd "DiffviewFileHistory %" end, "Show history for current file")

        -- nnoremap(prefix.."l", function() vim.cmd end)
    end)
end

return setup
