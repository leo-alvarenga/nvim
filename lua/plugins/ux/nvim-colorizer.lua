--- @type PluginSpec
return {
	src = "gh:norcalli/nvim-colorizer.lua",
	data = {
		config = function()
			require("colorizer").setup({
				"css",
				"javascript",
				"html",
				"typescript",
				"javascriptreact",
				"typescriptreact",
			})
		end,
	},
}
