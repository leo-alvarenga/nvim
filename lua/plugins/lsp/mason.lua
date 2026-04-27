--- @type PluginSpec
return {
	name = "mason",
	src = "gh:mason-org/mason.nvim",
	data = {
		config = function()
			require("mason").setup({})
		end,
	},
}
