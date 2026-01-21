local _buffer = require("utils.buffer")
local _keymap = require("utils.keymap")

local map = _keymap.map
local with_prefix = _keymap.with_prefix

local M = {}
-------------------------------------------------

---------------------
--  _buffer management
function M.buffer_management()
	map("", with_prefix("h", "buffers"), ":bprevious<cr>", "Go to previous _buffer")
	map("", with_prefix("l", "buffers"), ":bnext<cr>", "Go to next _buffer")

	-- Open new _buffer
	map("", with_prefix("n", "buffers"), ":enew<CR>", "Open new empty _buffer")

	-- Close current _buffer
	map(
		"",
		with_prefix("q", "buffers"),
		_buffer.close_current,
		"Close current Buffer (go to Dashboard if it's the last one)"
	)
end
---------------------

function M.tab_management()
	map("", with_prefix("h", "tabs"), ":tabprevious<cr>", "Go to previous Tab")
	map("", with_prefix("l", "tabs"), ":tabnext<cr>", "Go to next Tab")
	map("", with_prefix("n", "tabs"), ":tabnew<CR>", "Open new empty Tab")
	map("", with_prefix("q", "tabs"), ":tabclose<CR>", "Close current Tab")
	map("", with_prefix("o", "tabs"), ":tabonly<CR>", "Close all tabs (except for the current one)")
end

-- Basics and Helix related keymappings
function M.setup_basics()
	---------------------
	--  Undo/Redo
	map("", "u", ":undo<CR>", "Undo")
	map("", "U", ":redo<CR>", "Redo")
	---------------------

	M.buffer_management()
	M.tab_management()

	---------------------
	-- Motions inspired by Helix :D
	-- Ensuring selection is kept after indentation
	map("x", "<", "<gv")
	map("x", ">", ">gv")

	-- Going to start of the line with 'gh'
	map("", "gh", "0")

	-- Going to end of the line with 'gl'
	map("", "gl", "$")

	-- Going to end of the file with 'ge'
	map("", "ge", "G")
	---------------------

	---------------------
	-- Helix-like selection
	-- Whole line selection (downwards) with 'x'
	map("n", "x", "0v$j")
	map("x", "x", "0$j")

	-- Whole line selection (upwards) with 'x'
	map("n", "X", "0v$k")
	map("x", "X", "0$k")
	---------------------

	map("n", "K", vim.lsp.buf.hover, "LSP: Show signature help")
	map("x", "<C-k>", vim.lsp.buf.hover, "LSP: Show signature help")
end
-------------------------------------------------

-------------------------------------------------
-- Plugin related
function M.setup_plugin()
	-- Oil
	require("utils.keymap").map("", with_prefix("e", "pickers"), ":Oil<CR>", "Explore current directory using Oil")

	-- Git blame
	local _shared = require("utils.constants.shared")
	local to_cmd = _keymap.to_cmd

	map("", with_prefix("G", "actions"), to_cmd(_shared.git.blame.cmd), "Toggle git-blame")
	map("", with_prefix("g", "actions"), require("utils.grapple").toggle, "Toggle Grapple tag")

	local _format = require("utils.format")

	map({ "", "i" }, with_prefix("s", "formatters"), _format.format_current, "Format file (if possible)")
	map({ "", "i" }, with_prefix("S", "formatters"), _format.toggle_format_on_save, "Toggle format on save")

	_format.setup_autocmd()
end
-------------------------------------------------

-----------------
-- Grapple
-----------------

function M.setup_grapple()
	map("", with_prefix("m", "pickers"), ":Grapple toggle<cr>", "Grapple - Toggle tag")
	map("", with_prefix("n", "pickers"), ":Grapple cycle_tags next<cr>", "Grapple - Cycle next tag")
	map("", with_prefix("p", "pickers"), ":Grapple cycle_tags prev<cr>", "Grapple - Cycle previous tag")
end

-------------------------------------------------

-------------------------------------------------
-- Main setup
function M.setup_keymaps()
	M.setup_basics()
	M.setup_plugin()
end
-------------------------------------------------

return M
