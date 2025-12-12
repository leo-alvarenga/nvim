return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "VeryLazy",
	priority = 1000,
	config = function()
		local diag = require("tiny-inline-diagnostic")
		diag.setup()

		local _keymap = require("utils.keymap")
		local map = _keymap.map
		local with_prefix = _keymap.with_prefix

		diag.enable()

		map("", with_prefix("d", "actions"), diag.toggle, "Toggle tiny-inline-diagnostic")
	end,
}
