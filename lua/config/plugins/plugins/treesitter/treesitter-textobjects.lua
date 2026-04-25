--- @type PluginSpec
return {
	src = "gh:nvim-treesitter/nvim-treesitter-textobjects",
	version = "main",
	data = {
		config = function()
			require("nvim-treesitter-textobjects").setup({
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
						},
					},
				},
			})
		end,
	},
}
