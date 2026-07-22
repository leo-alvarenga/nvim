--- @type PluginSpec
return {
	name = "mason-lspconfig",
	src = "gh:mason-org/mason-lspconfig.nvim",
	data = {

		config = function()
			require("mason-lspconfig").setup({
				automatic_enable = true,
			})
		end,
	},
}
