--- @type PluginSpec
return {
	src = "gh:nvim-mini/mini.cursorword",
	data = {
		config = function()
			require("mini.cursorword").setup({})
		end,
	},
}
