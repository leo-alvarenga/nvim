local _shared = require("config.utils.constants.shared")
local _keymap = require("config.utils.keymap")

local M = {}

M.enabled = false

function M.toggle_twilight()
	M.enabled = not M.enabled

	vim.cmd(_keymap.to_cmd(_shared.twilight.cmd))
end

return M
