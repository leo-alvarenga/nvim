--- @type PluginSpec
return {
	name = "tiny-inline-diagnostic",
	src = "gh:rachartier/tiny-inline-diagnostic.nvim",
	data = {
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

			diag.enable()

			local _keymap = require("config.utils.keymap")

			local map = _keymap.map
			local with_prefix = _keymap.with_prefix

			map("", with_prefix("d", "actions"), diag.toggle, "Toggle tiny-inline-diagnostic")
		end,
	},
}
