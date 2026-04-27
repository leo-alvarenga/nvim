--- @type PluginSpec
return {
	src = "gh:nvim-mini/mini.comment",
	data = {
		config = function()
			require("mini.comment").setup({})
		end,
	},
}
