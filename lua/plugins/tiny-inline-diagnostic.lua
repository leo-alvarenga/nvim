return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "VeryLazy",
	priority = 1000,
	config = function()
		local diag = require("tiny-inline-diagnostic")
		diag.setup({
			preset = "simple",

			options = {
				enable_on_selecte = true,
				show_all_diags_on_cursorline = true,

				show_source = {
					enabled = true,
					if_many = true,
				},
			},
		})

		local _keymap = require("config.utils.keymap")
		local map = _keymap.map
		local with_prefix = _keymap.with_prefix

		diag.enable()

		map("", with_prefix("d", "actions"), diag.toggle, "Toggle tiny-inline-diagnostic")
	end,
}
