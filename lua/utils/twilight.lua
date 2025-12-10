local _shared = require("utils.constants.shared")

local M = {}

M.enabled = false

function M.toggle_twilight()
	M.enabled = not M.enabled

	local prefix = "[Twilight] "
	local status = prefix .. "Code blocks highlighting enabled"
	if not M.enabled then
		status = prefix .. "Code block highlighting disabled"
	end

	vim.cmd(_shared.twilight.cmd)
	vim.notify(status, vim.log.levels.INFO)
end

return M
