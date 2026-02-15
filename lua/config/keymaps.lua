local _buffer = require("config.utils.buffer")
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

	-- Close current Buffer
	map(
		"",
		with_prefix("q", "buffers"),
		_buffer.close_current,
		"Close current Buffer (go to Dashboard if it's the last one)"
	)
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
-- Plugin related
function M.setup_plugin()
	local _shared = require("values.constants.shared")
	local to_cmd = _keymap.to_cmd

	-- Neo-tree
	local _neo_tree = require("config.utils.neo-tree")
	map("", with_prefix("E", "pickers"), _neo_tree.toggle, "Explore current directory using Neotree")

	-- Oil
	map("", with_prefix("e", "pickers"), to_cmd(_shared.oil.cmd), "Manage the current directory using Oil")

	-- Actions
	map("", with_prefix("", "actions"), "", "   Misc actions")
	map("", with_prefix("g", "actions"), to_cmd(_shared.git.blame.cmd), "Toggle git-blame")

	-- Grapple
	map("", with_prefix("", "grapple"), "", "   Grapple actions")
	map("", with_prefix("g", "grapple"), to_cmd(_shared.grapple.toggle.cmd), "Toggle Grapple tag")
	map("", with_prefix("f", "grapple"), to_cmd(_shared.grapple.open.cmd), "See all Grapple tags")
	map("", with_prefix("l", "grapple"), to_cmd(_shared.grapple.next.cmd), "Cycle to next Grapple tag")
	map("", with_prefix("h", "grapple"), to_cmd(_shared.grapple.prev.cmd), "Cycle to previous Grapple tag")

	local _format = require("config.utils.format")

	-- Formatters
	map({ "", "i" }, with_prefix("", "formatters"), "", "   Formatter actions")
	map({ "", "i" }, with_prefix("s", "formatters"), _format.format_current, "Format file (if possible)")
	map({ "", "i" }, with_prefix("S", "formatters"), _format.toggle_format_on_save, "Toggle format on save")

	_format.setup_autocmd()

	-- Code Companion
	map("", with_prefix("", "ai"), "", "   AI actions")

	map(
		"",
		with_prefix("a", "ai"),
		to_cmd(_shared.codecompanion.actions.cmd, "codecompanion"),
		"See all Code Companion actions"
	)

	map(
		"",
		with_prefix("c", "ai"),
		to_cmd(_shared.codecompanion.chat.toggle.cmd, "codecompanion"),
		"Toggle Code Companion chat"
	)
	map(
		"",
		with_prefix("n", "ai"),
		to_cmd(_shared.codecompanion.chat.new.cmd, "codecompanion"),
		"Start a new Code Companion chat"
	)

	map(
		"",
		with_prefix("p", "ai"),
		to_cmd(_shared.codecompanion.prompt.cmd, "codecompanion"),
		"Toggle Code Companion prompt"
	)
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
