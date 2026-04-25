local theme = require("values.ui").theme or "catppuccin"

--- @type table<string, PluginSpec>
local themes = {
	catppuccin = {
		name = "catppuccin",
		src = "gh:catppuccin/nvim",
		data = {
			config = function()
				require("catppuccin").setup({
					transparent_background = true,
				})
			end,
		},
	},
	everforest = {
		name = "everforest",
		src = "gh:sainnhe/everforest",
		data = {
			config = function()
				require("everforest").setup({
					background = "soft",
				})
			end,
		},
	},
	kanagawa = {
		name = "kanagawa",
		src = "gh:rebelot/kanagawa.nvim",
		data = {
			config = function()
				require("kanagawa").setup({
					transparent = true,
				})
			end,
		},
	},
	onedark = {
		name = "onedark",
		src = "gh:navarasu/onedark.nvim",
		config = function()
			require("onedark").setup({
				style = "darker",
			})

			require("onedark").load()
		end,
	},
	tokyonight = {
		name = "tokyonight",
		src = "gh:folke/tokyonight.nvim",
		data = {
			config = function()
				require("tokyonight").setup({
					style = "night",
					transparent = true,
				})
			end,
		},
	},
	nordic = {
		name = "nordic",
		src = "gh:AlexvZyl/nordic.nvim",
		data = {
			config = function()
				require("nordic").load()
			end,
		},
	},
	base16 = {
		src = "gh:RRethy/base16-nvim",
	},
}

return themes[theme] or themes["catppuccin"]
