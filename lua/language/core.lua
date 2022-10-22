
local setup = require "setup"
local border = require "ui".border

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type , icon in pairs(signs) do
    local hl = "Diagnostic"..type
    vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = ""})
end

local  origin_util_open_loating_preview = vim.lsp.util.open_floating_preview
function  vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border  = opts.border or border
    origin_util_open_loating_preview(contents, syntax, opts, ...)
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

setup("lspconfig", function (lspconfig)
    setup("mason-lspconfig", function (mason)
        local default = require "language.default"
        mason.setup{}
        mason.setup_handlers{
            function (server)
                lspconfig[server].setup(default)
            end,
            clangd = function (server) end,
            rust_analyzer = function ()
                require "language.rust"
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
            end,
            cssls = function (server)
                lspconfig.cssls.setup{
                    on_attach = function (client, buf)
                        default.on_attach(client, buf)
                    end,
                   capabilities = default.capabilities
                }
            end
        }
    end)
end)
