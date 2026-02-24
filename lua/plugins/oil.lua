return {
	"stevearc/oil.nvim",

	config = function()
		require("oil").setup({})

		local _keymap = require("config.utils.keymap")
		local _shared = require("values.constants.shared")

		local map = _keymap.map
		local with_prefix = _keymap.with_prefix

		map("", with_prefix("e", "pickers"), _keymap.to_cmd(_shared.cmds.oil), _shared.descriptions.oil.long_desc)
	end,

	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	lazy = false,

	version = false,
}
