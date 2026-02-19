return {
	"gbprod/yanky.nvim",
	version = false,
	dependencies = {
		{ "kkharji/sqlite.lua" },
	},
	opts = {
		ring = { storage = "sqlite" },
	},
}
