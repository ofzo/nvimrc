local setup = require"setup"

setup("lsp_signature", {
    bind = true,
    handler_opts = { border = "rounded" }
})

setup("cmp", function(cmp)
    local kind_icons = require"ui".kind_icons
    cmp.setup({
        snippet = {
            expand = function (args)
                vim.fn["vsnip#anonymous"](args.body)
            end
        },
        mapping = {
            ["<Up>"] = cmp.mapping.select_prev_item(),
            ["<Down>"] = cmp.mapping.select_next_item(),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<ESC>"] = cmp.mapping.abort(),
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
            ["<Tab>"] = cmp.mapping({
                c = function()
                    if cmp.visible() then
                        cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
                    else
                        cmp.complete()
                    end
                end,
                i = function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
                    else
                        fallback()
                    end
                end
            }),
            ["<S-Tab>"] = cmp.mapping({
                c = function()
                    if cmp.visible() then
                        cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
                    else
                        cmp.complete()
                    end
                end,
                i = function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
                    else
                        fallback()
                    end
                end
            }),
        },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered()
        },
        formatting = {
            fields = {"kind", 'abbr', 'menu'},
            format = function(entry, item)
                item.kind = string.format("%s %s", kind_icons[item.kind], item.kind)
                item.menu = ({
                    nvim_lsp = '[LSP]',
                    vsnip = "[SNIP]",
                    buffer = '[BUFFER]',
                    path = "[PATH]"
                })[entry.source.name]
                return item
            end,
        },
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'vsnip' }, -- For vsnip users.
          { name = "buffer"}
        }),
        experimental = {
            ghost_text = true
        }
    })
    cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = 'buffer' }
        }
    })

    cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = 'path' },
            { name = 'cmdline' }
        })
    })
end)

require "language.core"
