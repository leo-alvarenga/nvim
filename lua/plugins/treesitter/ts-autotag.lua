--- @type PluginSpec
return {
	name = "nvim-ts-autotag",
	src = "gh:windwp/nvim-ts-autotag",
	data = {
		config = function()
			require("nvim-ts-autotag").setup({})
		end,
	},
}
