return {
	-- Helper overlay with Keymap hints
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {},
	keys = {
		{
			require("config.utils.keymap").with_prefix("?", "general"),
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}
