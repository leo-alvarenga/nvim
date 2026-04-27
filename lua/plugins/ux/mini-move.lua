--- @type PluginSpec
return {
	src = "gh:nvim-mini/mini.move",
	data = {
		config = function()
			require("mini.move").setup({})
		end,
	},
}
