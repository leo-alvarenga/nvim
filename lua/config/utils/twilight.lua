local _shared = require("config.utils.constants.shared")

local M = {}

M.enabled = false

function M.toggle_twilight()
	M.enabled = not M.enabled

	vim.cmd(_shared.twilight.cmd)
end

return M
