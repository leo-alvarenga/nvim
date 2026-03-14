local theme = require("values.ui").theme or "catppuccin"

local themes = {
	catppuccin = {
		"catppuccin/nvim",
		name = "catppuccin",
		opts = { transparent_background = true },
		priority = 1000,
	},
	everforest = {
		"sainnhe/everforest",
		lazy = false,
		name = "everforest",
		opts = { background = "soft" },
		priority = 1000,
	},
	kanagawa = {
		"rebelot/kanagawa.nvim",
		lazy = false,
		name = "kanagawa",
		opts = { transparent = true },
		priority = 1000,
	},
	onedark = {
		"navarasu/onedark.nvim",
		lazy = false,
		name = "onedark",
		config = function()
			require("onedark").setup({
				style = "darker",
			})

			require("onedark").load()
		end,
	},
	tokyonight = {
		"folke/tokyonight.nvim",
		lazy = false,
		name = "tokyonight",
		opts = { style = "night", transparent = true },
		priority = 1000,
	},
	nordic = {
		"AlexvZyl/nordic.nvim",
		lazy = false,
		name = "nordic",
		priority = 1000,
		config = function()
			require("nordic").load()
		end,
	},
}

return themes[theme] or themes["catppuccin"]
