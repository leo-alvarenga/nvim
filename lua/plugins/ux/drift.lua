--- @type PluginSpec
return {
	name = "drift-nvim",
	src = "gh:leo-alvarenga/drift.nvim",
	data = {
		config = function()
			require("drift-nvim").setup({
				keymaps = {
					["<leader>r"] = "drift",
				},
				notify = true,
				win_opts = {
					height = 0.8,
					width = 0.6,
				},
			})
		end,
	},
}
