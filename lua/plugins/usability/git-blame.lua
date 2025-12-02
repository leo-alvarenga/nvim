return {
	"f-person/git-blame.nvim",
	event = "VeryLazy",
	opts = {
		enabled = false,
		message_template = " <summary> • <date> • <author> • <<sha>>",
		date_format = "%m-%d-%Y %H:%M:%S",
		virtual_text_column = 1,
	},
	config = function()
		local _keymap = require("utils.keymap")
		local _shared = require("utils.constants.shared")

		local map = _keymap.map
		local to_cmd = _keymap.to_cmd

		map("", "<C-g>", to_cmd(_shared.git.blame.cmd), "Toggle git-blame")
	end,
}
