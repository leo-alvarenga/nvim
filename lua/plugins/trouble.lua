local with_prefix = require("utils.keymap").with_prefix

return {
	-- Better diagnostics
	"folke/trouble.nvim",
	opts = {
		win = { position = "right" },
	},
	cmd = "Trouble",
	keys = {
		{
			with_prefix("dd", "pickers"),
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "Buffer Diagnostics (Trouble)",
		},
		{
			with_prefix("dD", "pickers"),
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Diagnostics (Trouble)",
		},
		{
			with_prefix("cs", "pickers"),
			"<cmd>Trouble symbols toggle focus=false<cr>",
			desc = "Symbols (Trouble)",
		},
		{
			with_prefix("cl", "pickers"),
			"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
			desc = "LSP Definitions / references / ... (Trouble)",
		},
		{
			with_prefix("dL", "pickers"),
			"<cmd>Trouble loclist toggle<cr>",
			desc = "Location List (Trouble)",
		},
		{
			with_prefix("dQ", "pickers"),
			"<cmd>Trouble qflist toggle<cr>",
			desc = "Quickfix List (Trouble)",
		},
	},
}
