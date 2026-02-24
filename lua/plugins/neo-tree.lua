--- Safely toggle Neo-tree file explorer
--- @void
local function toggle()
	local _shared = require("values.constants.shared")

	local buf_name = vim.api.nvim_buf_get_name(0)

	if buf_name:match("oil://") then
		vim.notify_once(_shared.notifications.neo_tree.oil_warning, vim.log.levels.WARN)
		return
	end

	vim.cmd(_shared.neo_tree.cmd)
end

---@module 'neo-tree'
---@type neotree.Config
local opts = {
	window = {
		position = "float",
	},
}

return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	lazy = false,
	config = function()
		require("neo-tree").setup(opts)

		local _keymap = require("config.utils.keymap")

		local map = _keymap.map
		local with_prefix = _keymap.with_prefix

		map("", with_prefix("E", "pickers"), toggle, "Explore current directory using Neotree")
	end,
}
