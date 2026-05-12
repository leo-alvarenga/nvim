--- @type PluginSpec
return {
	name = "markview",
	src = "gh:OXY2DEV/markview.nvim",
	data = {
		config = function()
			require("markview").setup({})
		end,
	},
}
