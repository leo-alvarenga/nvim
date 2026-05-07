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
					overrides = function(colors)
						local _theme = colors.theme

						return {
							NormalFloat = { bg = "none" },
							FloatBorder = { bg = "none" },
							FloatTitle = { bg = "none" },

							-- Save an hlgroup with dark background and dimmed foreground
							-- so that you can use it where your still want darker windows.
							-- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
							NormalDark = { fg = _theme.ui.fg_dim, bg = _theme.ui.bg_m3 },

							-- Popular plugins that open floats will link to NormalFloat by default;
							-- set their background accordingly if you wish to keep them dark and borderless
							LazyNormal = { bg = _theme.ui.bg_m3, fg = _theme.ui.fg_dim },
							MasonNormal = { bg = _theme.ui.bg_m3, fg = _theme.ui.fg_dim },
						}
					end,
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
