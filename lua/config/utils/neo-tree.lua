local M = {}

--- Safely toggle Neo-tree file explorer
--- @void
function M.toggle()
	local _shared = require("values.constants.shared")

	local buf_name = vim.api.nvim_buf_get_name(0)

	if buf_name:match("oil://") then
		vim.notify_once(_shared.neo_tree.notifications.oil_warning, vim.log.levels.WARN)
		return
	end

	vim.cmd(_shared.neo_tree.cmd)
end

return M
