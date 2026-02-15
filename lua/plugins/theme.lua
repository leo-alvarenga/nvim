local theme = require("values.ui").theme or "catppuccin"

return {
	{
		"catppuccin/nvim",
		enabled = theme == "catppuccin",
		name = "catppuccin",
		opts = { transparent_background = true },
		priority = 1000,
	},
	{
		"sainnhe/everforest",
		enabled = theme == "everforest",
		lazy = false,
		name = "everforest",
		opts = { background = "soft" },
		priority = 1000,
	},
	{
		"rebelot/kanagawa.nvim",
		enabled = theme == "kanagawa",
		lazy = false,
		name = "kanagawa",
		opts = { transparent = true },
		priority = 1000,
	},
	{
		"navarasu/onedark.nvim",
		enabled = theme == "onedark",
		lazy = false,
		name = "onedark",
		config = function()
			require("onedark").setup({
				style = "darker",
			})

			require("onedark").load()
		end,
	},
	{
		"folke/tokyonight.nvim",
		enabled = theme == "tokyonight",
		lazy = false,
		name = "tokyonight",
		opts = { style = "night", transparent = true },
		priority = 1000,
	},
}
