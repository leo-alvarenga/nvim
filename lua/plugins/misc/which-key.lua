--- @type PluginSpec
return {
	name = "which-key",
	src = "gh:folke/which-key.nvim",
	data = {
		config = function()
			require("which-key").setup({})
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
