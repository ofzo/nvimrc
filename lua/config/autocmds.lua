-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
vim.cmd([[
    hi NeoTreeCursorLine guibg=#1179cb cterm=bold guifg=#ffffff
    " autocmd! BufLeave * :w
]])
