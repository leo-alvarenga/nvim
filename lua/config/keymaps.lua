local _keymap = require("config.utils.keymap")

local map = _keymap.map
local with_prefix = _keymap.with_prefix

local M = {}
-------------------------------------------------

---------------------
-- Buffer management
function M.buffer_management()
	map("", with_prefix("h", "buffers"), ":bprevious<cr>", "Go to previous Buffer")
	map("", with_prefix("l", "buffers"), ":bnext<cr>", "Go to next Buffer")

	-- Open new Buffer
	map("", with_prefix("n", "buffers"), ":enew<CR>", "Open new empty Buffer")
end
---------------------

function M.tab_management()
	map("", with_prefix("", "tabs"), "", " 󰓩  Tabs")

	map("", with_prefix("h", "tabs"), ":tabprevious<cr>", "Go to previous Tab")
	map("", with_prefix("l", "tabs"), ":tabnext<cr>", "Go to next Tab")
	map("", with_prefix("n", "tabs"), ":tabnew<CR>", "Open new empty Tab")
	map("", with_prefix("q", "tabs"), ":tabclose<CR>", "Close current Tab")
	map("", with_prefix("o", "tabs"), ":tabonly<CR>", "Close all tabs (except for the current one)")
end

-- Basic and Helix related keymappings
function M.setup_basics()
	map("", with_prefix("", "general"), "", "   General")

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
	map({ "n", "x" }, "<C-k>", vim.lsp.buf.hover, "LSP: Show signature help")
end
-------------------------------------------------

-------------------------------------------------
-- Main setup
function M.setup_keymaps()
	M.setup_basics()
	map("", with_prefix("", "actions"), "", "   Misc actions")
end
-------------------------------------------------

return M
