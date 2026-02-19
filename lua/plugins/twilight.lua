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

return {
	-- Toggleable block highlights for enhanced readability
	"folke/twilight.nvim",
	config = function()
		local _keymap = require("config.utils.keymap")
		local map = _keymap.map
		local with_prefix = _keymap.with_prefix

		map("", with_prefix("w", "actions"), M.toggle_twilight, "Toggle Twilight dim")
	end,
	version = false,
}
