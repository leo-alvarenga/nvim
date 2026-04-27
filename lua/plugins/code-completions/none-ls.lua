--- @type PluginSpec
return {
	name = "null-ls",
	src = "gh:nvimtools/none-ls.nvim",
	data = {
		config = function()
			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.prettier,
					require("none-ls.diagnostics.eslint"),
				},
			})
		end,
	},
}
