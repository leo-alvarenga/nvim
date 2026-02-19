return {
	"f-person/git-blame.nvim",
	event = "VeryLazy",

	config = function()
		require("gitblame").setup({
			enabled = false,
			message_template = " <summary> • <date> • <author> • <<sha>>",
			date_format = "%m-%d-%Y %H:%M:%S",
			virtual_text_column = 1,
		})

		local _keymap = require("config.utils.keymap")
		local _shared = require("values.constants.shared")

		local map = _keymap.map
		local with_prefix = _keymap.with_prefix

		map("", with_prefix("g", "actions"), _keymap.to_cmd(_shared.git.blame.cmd), "Toggle git-blame")
	end,
}
