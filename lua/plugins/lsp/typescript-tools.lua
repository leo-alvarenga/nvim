--- @type PluginSpec
return {
	name = "typescript-tools",
	src = "gh:pmizio/typescript-tools.nvim",
	data = {
		config = function()
			require("typescript-tools").setup({})
		end,
	},
}
