local _shared = require("utils.constants.shared")

local M = {}

M.enabled = false

function M.toggle_twilight()
	M.enabled = not M.enabled

	vim.cmd(_shared.twilight.cmd)
end

return M
