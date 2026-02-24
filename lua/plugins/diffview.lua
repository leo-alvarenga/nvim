local M = {}

M.enabled = false

function M.toggle_diffview()
	local _shared = require("values.constants.shared")

	if M.enabled then
		vim.cmd(_shared.cmds.diffview.close)
		M.enabled = false

		vim.notify(_shared.notifications.diffview.close, vim.log.levels.INFO, { title = "Diffview" })
		return
	end

	vim.cmd(_shared.cmds.diffview.open)
	M.enabled = true

	vim.notify(_shared.notifications.diffview.open, vim.log.levels.INFO, { title = "Diffview" })
end

return {
	"sindrets/diffview.nvim",
	config = function()
		require("diffview").setup({})

		local _keymap = require("config.utils.keymap")
		local _shared = require("values.constants.shared")

		local map = _keymap.map
		local with_prefix = _keymap.with_prefix

		map("", with_prefix("G", "actions"), M.toggle_diffview, _shared.descriptions.diffview.toggle)
	end,
	version = false,
}
