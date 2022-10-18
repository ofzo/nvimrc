function setup(mapx)
    local prefix = "<Space>f"
    mapx.name(prefix, "Telescope")

    mapx.group("silent", {}, function()
        nnoremap(prefix.."f", function()  vim.cmd "Telescope find_files" end, "Telescope find files")
        nnoremap(prefix.."t", function() vim.cmd "Telescope live_grep" end, "Telescope live grep")
    end)
end

return setup
