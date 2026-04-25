local M = {}

M.enabled = false

function M.toggle_twilight()
	M.enabled = not M.enabled

	local status = "disabled"
	if M.enabled then
		status = "enabled"
	end

	local _shared = require("values.constants.shared")

	vim.cmd(_shared.cmds.twilight)
	vim.notify(_shared.notifications.twilight[status], vim.log.levels.INFO)
end

--- @type PluginSpec
return {
	-- Toggleable block highlights for enhanced readability
	src = "gh:folke/twilight.nvim",
	data = {
		config = function()
			local _keymap = require("config.utils.keymap")
			local map = _keymap.map
			local with_prefix = _keymap.with_prefix

			map("", with_prefix("w", "actions"), M.toggle_twilight, "Toggle Twilight dim")
		end,
	},
}
