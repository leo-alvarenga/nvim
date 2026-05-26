-- Leaving this here for now; nvim-treesitter is currently archived, this is my fallback plan in case the project is fully dropped

--- @type PluginSpec
return {
	name = "arborist",
	src = "gh:arborist-ts/arborist.nvim",
	version = "main",
	data = {
		config = function()
			require("arborist").setup({
				prefer_wasm = false,
				ensure_installed = require("values.languages").languages,
			})
		end,
	},
}
