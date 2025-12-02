local _buffer = require("utils.buffer")
local _format = require("utils.format")
local _keymap = require("utils.keymap")

local map = _keymap.map

local M = {}
-------------------------------------------------

---------------------
--  _buffer management
function M.buffer_management()
	map("", "<leader>h", ":bprevious<cr>", "Go to previous _buffer")
	map("", "<leader>l", ":bnext<cr>", "Go to next _buffer")

	-- Open new _buffer
	map("", "<leader>n", ":enew<CR>", "Open new empty _buffer")

	-- Close current _buffer
	map("", "<leader>q", _buffer.close_current, "Close current Buffer (go to Dashboard if it's the last one)")
end
---------------------

function M.tab_management()
	local tab_prefix = "<C-t>"

	map("", tab_prefix .. "h", ":tabprevious<cr>", "Go to previous Tab")
	map("", tab_prefix .. "l", ":tabnext<cr>", "Go to next Tab")

	map("", tab_prefix .. "n", ":tabnew<CR>", "Open new empty Tab")

	map("", tab_prefix .. "q", ":tabclose<CR>", "Close current Tab")

	map("", tab_prefix .. "o", ":tabonly<CR>", "Close all tabs (except for the current one)")
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
end
-------------------------------------------------

-------------------------------------------------
-- Formatting and Diagnostics
function M.setup_fmt()
	map({ "", "i" }, "<C-s>", _format.format_current, "Format file (if possible)")
end
-------------------------------------------------

-----------------
-- Grapple
-----------------

function M.setup_grapple()
	map("", "<leader>m", ":Grapple toggle<cr>", "Grapple - Toggle tag")
	map("", "<leader>n", ":Grapple cycle_tags next<cr>", "Grapple - Cycle next tag")
	map("", "<leader>p", ":Grapple cycle_tags prev<cr>", "Grapple - Cycle previous tag")
end

-------------------------------------------------

-------------------------------------------------
-- Main setup
function M.setup_keymaps()
	M.setup_basics()
	M.setup_fmt()
end
-------------------------------------------------

return M
