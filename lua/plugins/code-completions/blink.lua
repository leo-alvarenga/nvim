--- @type PluginSpec
return {
	src = "gh:saghen/blink.cmp",
	version = "v1.10.2",
	data = {
		config = function()
			require("blink.cmp").setup({
				keymap = {
					preset = "default",
					["<C-r>"] = { "show", "show_documentation", "hide_documentation" },
				},

				appearance = {
					nerd_font_variant = "mono",
				},

				completion = {
					menu = {
						border = "rounded", -- or 'none' if you want a flat card
						winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
					},
					documentation = {
						auto_show = true,
						window = {
							border = "rounded",
							winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
						},
					},
					ghost_text = {
						enabled = false,
					},
					list = {
						selection = {
							preselect = true,
							auto_insert = false,
						},
					},
				},

				signature = {
					enabled = true,
				},

				sources = {
					default = { "lsp", "path", "snippets", "buffer" },
				},

				fuzzy = { implementation = "prefer_rust_with_warning" },
			})

			vim.api.nvim_create_autocmd("ColorScheme", {
				callback = function()
					local colors = require("values.constants.shared").colors

					local groups = {
						-- The actual menu (using the lighter 'Wave' background)
						BlinkCmpMenu = { fg = colors.fujiWhite, bg = colors.sumiInk4 },
						BlinkCmpMenuBorder = { fg = colors.crystalBlue, bg = colors.sumiInk4 }, -- Seamless border

						-- The selection (what you're currently highlighting)
						BlinkCmpMenuSelection = { fg = "NONE", bg = colors.waveBlue2, bold = true },

						-- Documentation window
						BlinkCmpDoc = { fg = colors.fujiWhite, bg = colors.sumiInk4 },
						BlinkCmpDocBorder = { fg = colors.sumiInk4, bg = colors.sumiInk4 },

						-- Item details (kind, source)
						BlinkCmpLabel = { fg = colors.fujiWhite },
						BlinkCmpLabelMatch = { fg = colors.crystalBlue, bold = true }, -- The part you typed
					}

					for group, settings in pairs(groups) do
						vim.api.nvim_set_hl(0, group, settings)
					end
				end,
			})
		end,
	},
}
