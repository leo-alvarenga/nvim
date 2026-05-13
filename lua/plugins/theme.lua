--- @type PluginSpec
return {
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

						NormalDark = { fg = _theme.ui.fg_dim, bg = _theme.ui.bg_m3 },

						LazyNormal = { bg = _theme.ui.bg_m3, fg = _theme.ui.fg_dim },
						MasonNormal = { bg = _theme.ui.bg_m3, fg = _theme.ui.fg_dim },
					}
				end,
			})
		end,
	},
}
