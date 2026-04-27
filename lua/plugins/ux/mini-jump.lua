--- @type PluginSpec
return {
	src = "gh:nvim-mini/mini.jump",
	data = {
		config = function()
			require("mini.jump").setup({})
		end,
	},
}
