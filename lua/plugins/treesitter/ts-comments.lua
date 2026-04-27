--- @type PluginSpec
return {
	name = "ts-comments",
	src = "gh:folke/ts-comments.nvim",
	data = {
		config = function()
			require("ts-comments").setup({})
		end,
	},
}
