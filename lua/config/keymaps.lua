-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
    local keys = require("lazy.core.handler").handlers.keys
    ---@cast keys LazyKeysHandler
    -- do not create the keymap if a lazy keys handler exists
    if not keys.active[keys.parse({ lhs, mode = mode }).id] then
        opts = opts or {}
        opts.silent = opts.silent ~= false
        vim.keymap.set(mode, lhs, rhs, opts)
    end
end

map("n", "<TAB>", ":><CR>", { desc = "add indent", silent = true })
map("i", "<TAB>", ":><CR>", { desc = "add indent", silent = true })

map("i", "<S-TAB>", ":<<CR>", { desc = "decrease indent", silent = true })
map("n", "<S-TAB>", ":<<CR>", { desc = "decrease indent", silent = true })
map("v", "<S-TAB>", ":<<CR>", { desc = "decrease indent", silent = true })

map("n", "<leader>gdf", ":DiffviewOpen<CR>", { desc = "open diff window" })
map("n", "<leader>z", ":undo<CR>", { desc = "undo" })
map("n", "<S-z>", ":redo<CR>", { desc = "redo" })

vim.cmd("command Q q")
vim.cmd("command X x")
vim.cmd("command W w")

map("n", "<leader>tr", function()
    Util.float_term(nil, { cwd = Util.get_root() })
end, { desc = "Terminal (root dir)" })
map("n", "<leader>tc", function()
    Util.float_term()
end, { desc = "Terminal (cwd)" })

-- code jump
map("n", "<leader>gd", "gr<CR>", { desc = "Goto Definition" })
map("n", "<leader>gr", "gr<CR>", { desc = "References" })
map("n", "<leader>gD", "gD<CR>", { desc = "Goto Declaration" })
map("n", "<leader>gI", "gI<CR>", { desc = "Goto Implementation" })
map("n", "<leader>gt", "gt<CR>", { desc = "Goto Type Definition" })
