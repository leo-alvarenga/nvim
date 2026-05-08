--- @type PluginSpec
return {
	name = "fidget",
	src = "gh:j-hui/fidget.nvim",
	data = {
		config = function()
			require("fidget").setup({})
		end,
	},
}
