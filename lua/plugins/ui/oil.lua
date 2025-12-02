return {
	"stevearc/oil.nvim",
	dependencies = {
		{
			"nvim-tree/nvim-web-devicons",
		},
	},

	config = function()
		require("utils.keymap").map("", "<leader>e", ":Oil<CR>", "Explore current directory using Oil")
	end,

	lazy = false,
	opts = {},

	version = false,
}
