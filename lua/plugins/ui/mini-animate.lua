--- @type PluginSpec
return {
	name = "echasnovski/mini.animate",
	src = "gh:echasnovski/mini.animate",
	data = {
		config = function()
			require("mini.animate").setup()
		end,
	},
}
