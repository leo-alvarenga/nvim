--- @type PluginSpec
return {
	name = "ufo",
	src = "gh:kevinhwang91/nvim-ufo",
	data = {
		config = function()
			vim.o.foldcolumn = "0"
			vim.o.foldlevel = 99
			vim.o.foldlevelstart = 99
			vim.o.foldenable = true

			require("ufo").setup()
		end,
	},
}
