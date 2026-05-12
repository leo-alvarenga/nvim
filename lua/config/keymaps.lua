local _shared = require("values.constants.shared")
local _keymap = require("config.utils.keymap")

local map = _keymap.map
local with_prefix = _keymap.with_prefix
local to_cmd = _keymap.to_cmd

local M = {}
-------------------------------------------------

---------------------
-- Buffer management
function M.buffer_management()
	-- Open new Buffer
	map("", with_prefix("n", "buffers"), to_cmd("enew"), _shared.descriptions.buffers.new)
end
---------------------

function M.tab_management()
	map("", with_prefix("", "tabs"), "", _shared.descriptions.tabs)

	map("", with_prefix("h", "tabs"), to_cmd("tabprevious"), _shared.descriptions.tab.prev)
	map("", with_prefix("l", "tabs"), to_cmd("tabnext"), _shared.descriptions.tab.next)
	map("", with_prefix("n", "tabs"), to_cmd("tabnew"), _shared.descriptions.tab.new)
	map("", with_prefix("q", "tabs"), to_cmd("tabclose"), _shared.descriptions.tab.close)
	map("", with_prefix("o", "tabs"), to_cmd("tabonly"), _shared.descriptions.tab.only)
end

-- Basic and Helix related keymappings
function M.setup_basics()
	map("", with_prefix("", "general"), "", _shared.descriptions.general)

	---------------------
	--  Undo/Redo
	map("", "u", to_cmd("undo"), "Undo")
	map("", "U", to_cmd("redo"), "Redo")
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

	map("n", "K", vim.lsp.buf.hover, _shared.descriptions.lsp.hover)
	map({ "n", "x" }, "<C-k>", vim.lsp.buf.hover, _shared.descriptions.lsp.hover)

	map("n", "J", vim.lsp.buf.signature_help, _shared.descriptions.lsp.signature_help)
	map({ "n", "x" }, "<C-j>", vim.lsp.buf.signature_help, _shared.descriptions.lsp.signature_help)
end
-------------------------------------------------

-------------------------------------------------
-- Main setup
function M.setup_keymaps()
	M.setup_basics()

	map("", with_prefix("", "actions"), "", _shared.descriptions.actions)
	map("", with_prefix("r", "actions"), to_cmd("restart"), _shared.descriptions.restart)
	map("", with_prefix("q", "actions"), to_cmd("q"), _shared.descriptions.restart)
end
-------------------------------------------------

return M
