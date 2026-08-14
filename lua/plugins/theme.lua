local function get_theme()
	--- @type PluginSpec[]
	local themes = {
		everforest = {
			name = "everforest",
			src = "gh:sainnhe/everforest",
			data = {
				config = function()
					vim.cmd([[
						if has('termguicolors')
							set termguicolors
						endif

						" For dark version.
						set background=dark

						" Set contrast.
						" This configuration option should be placed before `colorscheme everforest`.
						" Available values: 'hard', 'medium'(default), 'soft'
						let g:everforest_background = 'hard'

						" For better performance
						let g:everforest_better_performance = 1

						colorscheme everforest
					]])
				end,
			},
		},

		kanagawa = {
			name = "kanagawa",
			src = "gh:rebelot/kanagawa.nvim",
			data = {
				config = function()
					vim.cmd([[
						colorscheme kanagawa
					]])
				end,
			},
		},
	}

	return themes[require("values.ui").theme] or themes["everforest"]
end

--- @type PluginSpec
return get_theme()
