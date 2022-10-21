local ok, lspconfig =  pcall(require, "lspconfig")
if not ok then
    vim.notify "Con't load lspconfig"
end

local ok, mason = pcall(require, "mason-lspconfig")
if not ok then
    vim.notify "Con't load mason-lspconfig"
end


local ok, color = pcall(require, "document-color")
if not ok then
    vim.notify "Can't load document-color"
end

vim.diagnostic.config({
  virtual_text = {
    spacing = 4,
    prefix = "●",
    severity = vim.diagnostic.severity.WARN
  },
  severity_sort = true,
  float = {
    border = 'rounded',
    source = 'if_many',
    header = 'Diagnostic',
    prefix = '',
  },
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type , icon in pairs(signs) do
    local hl = "Diagnostic"..type
    vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = ""})
end


vim.cmd [[ autocmd ColorScheme * highlight NormalFloat guibg=white ]]
vim.cmd [[ autocmd ColorScheme * highlight FloatBorder guifg=black guibg=white ]]


local border = {
  { "╭", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╮", "FloatBorder" },
  { "│", "FloatBorder" },
  { "╯", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╰", "FloatBorder" },
  { "│", "FloatBorder" },
}

local  origin_util_open_loating_preview = vim.lsp.util.open_floating_preview
function  vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border  = opts.border or border
    origin_util_open_loating_preview(contents, syntax, opts, ...)
end

local default = require "language.default"
mason.setup{}

mason.setup_handlers {
    function (server)
        lspconfig[server].setup(default)
    end,

    clangd = function (server) end,
    rust_analyzer = function (server) 
        lspconfig.rust_analyzer.setup { 
            on_attach = function (client, buf)
                default.on_attach(client, buf)
            end,
            capabilities = default.capabilities 
        }
    end,
    tsserver = function (server) 
        lspconfig.tsserver.setup { 
            on_attach = function (client, buf)
                default.on_attach(client, buf)
            end,
            capabilities = default.capabilities }
    end,
    jsonls = function (server) end,

    sumneko_lua = function(server)
        lspconfig.sumneko_lua.setup{
            on_attach = function (client, buf)
                default.on_attach(client, buf)
                client.server_capabilities.documentFormattingProvider= false
            end,
            capabilities = default.capabilities
        }
    end
}
