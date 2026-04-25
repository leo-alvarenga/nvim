--- @type PluginSpec
return {
	src = "gh:nvim-mini/mini.pick",
	data = {
		config = function()
			local pick = require("mini.pick")
			pick.setup({})

			vim.ui.select = pick.ui_select
		end,
	},
}
