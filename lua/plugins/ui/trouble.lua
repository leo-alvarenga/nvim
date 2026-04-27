local _keymap = require("config.utils.keymap")

local with_prefix = _keymap.with_prefix

--- @type PluginSpec
return {
	name = "trouble",
	src = "gh:folke/trouble.nvim",
	data = {
		config = function()
			require("trouble").setup({
				win = { position = "right" },
			})
		end,

		keys = {
			{
				mode = "",
				key = with_prefix("dd", "pickers"),
				command = "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				mode = "",
				key = with_prefix("dD", "pickers"),
				command = "<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				mode = "",
				key = with_prefix("cs", "pickers"),
				command = "<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				mode = "",
				key = with_prefix("dL", "pickers"),
				command = "<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				mode = "",
				key = with_prefix("dQ", "pickers"),
				command = "<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
}
