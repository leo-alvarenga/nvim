--- @type PluginSpec
return {
	name = "which-key",
	src = "gh:folke/which-key.nvim",
	data = {
		config = function()
			local ui = require("values.ui")

			require("which-key").setup({ win = { border = ui.border } })
		end,
		keys = {
			{
				mode = "",
				key = require("config.utils.keymap").with_prefix("?", "general"),
				desc = "Buffer Local Keymaps (which-key)",
				command = function()
					require("which-key").show({ global = false })
				end,
			},
		},
	},
}
