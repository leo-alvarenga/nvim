local _keymap = require("config.utils.keymap")

local map = _keymap.map
local with_prefix = _keymap.with_prefix

--- @type PluginSpec
return {
	name = "neo-tree",
	src = "gh:nvim-neo-tree/neo-tree.nvim",
	version = "v3.x",
	data = {
		config = function()
			require("neo-tree").setup({ window = {
				position = "float",
			} })

			local function toggle()
				local _shared = require("values.constants.shared")

				local buf_name = vim.api.nvim_buf_get_name(0)

				if buf_name:match("oil://") then
					vim.notify_once(_shared.notifications.neo_tree.oil_warning, vim.log.levels.WARN)
					return
				end

				vim.cmd(_shared.cmds.neo_tree)
			end

			map("", with_prefix("E", "pickers"), toggle, "Explore current directory using Neotree")
		end,
	},
}
