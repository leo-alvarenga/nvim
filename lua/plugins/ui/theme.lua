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
}

local function get_theme()
	local _config = require("utils.config")

	return themes[_config:get("theme") or "catppuccin"]
end

return get_theme()
