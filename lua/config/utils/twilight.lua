local M = {}

M.enabled = false

function M.toggle_twilight()
	M.enabled = not M.enabled

	local status = "disabled"
	if M.enabled then
		status = "enabled"
	end

	local _shared = require("values.constants.shared")

	vim.cmd(_shared.twilight.cmd)
	vim.notify(_shared.twilight.notifications[status], vim.log.levels.INFO)
end

return M
