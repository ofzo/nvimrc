
local setup = require "setup"
local default = require "language.default"

setup("rust-tools", {
     tools = {
         executor = require "rust-tools/executors".termopen,
         inlay_hints = {
             auto = true
         },
         hover_actions = {
             border = require"ui".border,
             auto_focus = true
         }
     },
     server = {
         capabilities = default.capabilities,
         on_attach = function (client, buf)
             default.on_attach(client, buf)
         end,
         setting = {
             ["rust-analyzer"] = { checkOnSave = { command = "clippy" } }
         },
         standalone = true
     }
 })
 
