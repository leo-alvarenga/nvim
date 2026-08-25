--- @type PluginSpec
return {
	name = "supermaven",
	src = "gh:supermaven-inc/supermaven-nvim",
	data = {
		config = function()
			require("supermaven-nvim").setup({})
		end,
	},
}
