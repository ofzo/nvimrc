local setup = require "setup"

local M = {}

local ok, cmp = setup("cmp_nvim_lsp")
if not ok then
    return
end

M.capabilities = cmp.default_capabilities()

M.capabilities.textDocument.foldingRange =  {
    dynamicRgistration = false,
    lineFoldingonly = true
}

M.on_attach = function (client, buf)
    vim.api.nvim_buf_set_option(buf, "omnifunc", "v:lua.vim.lsp.omnifunc")
    local bufpts = { silent = true, buffer = true }

end

return M
