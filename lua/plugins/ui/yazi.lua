local _keymap = require("config.utils.keymap")
local _shared = require("values.constants.shared")

--- @type PluginSpec
return {
	name = "yazi",
	src = "gh:mikavilpas/yazi.nvim",
	data = {
		config = function()
			vim.g.loaded_netrwPlugin = 1

			local yazi = require("yazi")
			yazi.setup({
				open_for_directories = true,
			})
		end,
		keys = {
			{
				mode = { "n", "v" },
				desc = _shared.descriptions.yazi.open,
				key = _keymap.with_prefix("e", "pickers"),
				command = _keymap.to_cmd(_shared.cmds.yazi.open),
			},
			{
				mode = "",
				desc = _shared.descriptions.yazi.cwd,
				key = _keymap.with_prefix("E", "pickers"),
				command = _keymap.to_cmd(_shared.cmds.yazi.cwd),
			},
			{
				mode = "",
				desc = _shared.descriptions.yazi.toggle,
				key = _keymap.with_prefix("y", "pickers"),
				command = _keymap.to_cmd(_shared.cmds.yazi.toggle),
			},
		},
	},
}
