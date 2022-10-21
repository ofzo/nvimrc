return function (mapx)
    local prefix = "<Space>f"
    mapx.name(prefix, "Telescope")

    mapx.group("silent", {}, function()
        mapx.nnoremap(prefix.."f", function()  vim.cmd "Telescope find_files" end, "Telescope find files")
        mapx.nnoremap(prefix.."t", function() vim.cmd "Telescope live_grep" end, "Telescope live grep")
    end)
end

