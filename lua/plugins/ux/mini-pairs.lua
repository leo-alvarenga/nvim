--- @type PluginSpec
return {
	src = "gh:nvim-mini/mini.pairs",
	data = {
		config = function()
			require("mini.pairs").setup({})
		end,
	},
}
