--- @type PluginSpec
return {
	src = "gh:nvim-mini/mini.surround",
	data = {
		config = function()
			require("mini.surround").setup({})
		end,
	},
}
