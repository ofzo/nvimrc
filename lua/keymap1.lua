--------------------------------------------------------------------
vim.g.mapleader = ";"
local ok, mapx = pcall(require, "mapx")
if ok then
    mapx.setup { global = true , whichkey = true }
end
-- require "keymap"
nnoremap("<Space>e", function() vim.cmd "NvimTreeToggle" end, "NvimTreeToggle")
nnoremap("<Space>.", function() vim.cmd "CodeAction" end, "CodeAction")
nnoremap("<Space>\\", function() vim.cmd "SymbolsOutline" end, "SymbolsOutline")
-- nnoremap("<Space>gdf", function() vim.cmd "DiffviewOpen" end, "DiffviewOpen")
-- nnoremap("<Space>gfh", function() vim.cmd "DiffviewFileHistory %" end, "Show history for current file")

-- nnoremap("<Space>s", ":w<CR>", "Save")
-- nnoremap("<Space>w", ":x<CR>", "Write and Close")
-- nmap("<Space>z", ":undo<CR>", "Undo")
-- nmap("<Space>r", ":redo<CR>", "Redo")

nnoremap("<ESC><ESC>", function() 
    vim.cmd "set nohlsearch"
end, "Cancel Highlight")
nnoremap("<Space>q", ":q<CR>", "Quit")

nnoremap("<Space>ff", function() vim.cmd "Telescope find_files" end, "Telescope find file")
-- find text
nnoremap("<Space>ft", function() vim.cmd "Telescope live_grep" end, "Telescope live grep")

--------------------------------------------------------------------
-- inoremap("<CR>", 
--   [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], 
--    "silent", "expr")
nnoremap("ga", function() vim.lsp.buf.code_action() end, "silent" )

vim.api.nvim_create_augroup("CocGroup", { clear = true })
vim.api.nvim_create_autocmd("CursorHold", {
    group = "CocGroup",
    command = "lua vim.diagnostic.open_float(nil, { focusable = false })",
    desc = "Highlight symbol under cursor on CursorHold"
})

nnoremap("g[", function() vim.diagnostic.goto_prev() end, "silent")
nnoremap("g]", function() vim.diagnostic.goto_next() end, "silent" )
-- autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 200)
--

-- key code---------------------------------------------------------------------------------------\
--[[
notation	meaning		    equivalent	decimal value(s)	 
-----------------------------------------------------------------------
<Nul>		zero			CTRL-@	  0 (stored as 10) *<Nul>*
<BS>		backspace		CTRL-H	  8	*backspace*
<Tab>		tab			CTRL-I	  9	*tab* *Tab*
							*linefeed*
<NL>		linefeed		CTRL-J	 10 (used for <Nul>)
<CR>		carriage return		CTRL-M	 13	*carriage-return*
<Return>	same as <CR>				*<Return>*
<Enter>		same as <CR>				*<Enter>*
<Esc>		escape			CTRL-[	 27	*escape* *<Esc>*
<Space>		space				 32	*space*
<lt>		less-than		<	 60	*<lt>*
<Bslash>	backslash		\	 92	*backslash* *<Bslash>*
<Bar>		vertical bar		|	124	*<Bar>*
<Del>		delete				127
<CSI>		command sequence intro  ALT-Esc 155	*<CSI>*

<EOL>		end-of-line (can be <CR>, <NL> or <CR><NL>,
		depends on system and 'fileformat')	*<EOL>*
<Ignore>	cancel wait-for-character		*<Ignore>*
<NOP>		no-op: do nothing (useful in mappings)	*<Nop>*

<Up>		cursor-up			*cursor-up* *cursor_up*
<Down>		cursor-down			*cursor-down* *cursor_down*
<Left>		cursor-left			*cursor-left* *cursor_left*
<Right>		cursor-right			*cursor-right* *cursor_right*
<S-Up>		shift-cursor-up
<S-Down>	shift-cursor-down
<S-Left>	shift-cursor-left
<S-Right>	shift-cursor-right
<C-Left>	control-cursor-left
<C-Right>	control-cursor-right
<F1> - <F12>	function keys 1 to 12		*function_key* *function-key*
<S-F1> - <S-F12> shift-function keys 1 to 12	*<S-F1>*
<Help>		help key
<Undo>		undo key
<Insert>	insert key
<Home>		home				*home*
<End>		end				*end*
<PageUp>	page-up				*page_up* *page-up*
<PageDown>	page-down			*page_down* *page-down*
<kUp>		keypad cursor-up		*keypad-cursor-up*
<kDown>		keypad cursor-down		*keypad-cursor-down*
<kLeft>		keypad cursor-left		*keypad-cursor-left*
<kRight>	keypad cursor-right		*keypad-cursor-right*
<kHome>		keypad home (upper left)	*keypad-home*
<kEnd>		keypad end (lower left)		*keypad-end*
<kOrigin>	keypad origin (middle)		*keypad-origin*
<kPageUp>	keypad page-up (upper right)	*keypad-page-up*
<kPageDown>	keypad page-down (lower right)	*keypad-page-down*
<kDel>		keypad delete 			*keypad-delete*
<kPlus>		keypad +			*keypad-plus*
<kMinus>	keypad -			*keypad-minus*
<kMultiply>	keypad *			*keypad-multiply*
<kDivide>	keypad /			*keypad-divide*
<kPoint>	keypad .			*keypad-point*
<kComma>	keypad ,			*keypad-comma*
<kEqual>	keypad =			*keypad-equal*
<kEnter>	keypad Enter			*keypad-enter*
<k0> - <k9>	keypad 0 to 9			*keypad-0* *keypad-9*
<S-…>		shift-key			*shift* *<S-*
<C-…>		control-key			*control* *ctrl* *<C-*
<M-…>		alt-key or meta-key		*META* *ALT* *<M-*
<A-…>		same as <M-…>			*<A-*
<D-…>		command-key or "super" key	*<D-*
--]]
