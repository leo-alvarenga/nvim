--- @type PluginSpec
return {
	name = "gitsigns",
	src = "gh:lewis6991/gitsigns.nvim",
	data = {
		events = { "BufReadPre" },

		config = function()
			require("gitsigns").setup({})
		end,
	},
}
