return {
	"gbprod/yanky.nvim",
	version = false,
	dependencies = {
		{
			"kkharji/sqlite.lua",
		},
	},
	opts = {
		highlight = {
			on_put = false,
			on_yank = false,
		},
		ring = {
			storage = "sqlite",
		},

		system_clipboard = {
			sync_with_ring = true,
			clipboard_register = nil,
		},
	},
}
