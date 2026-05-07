--- @type PluginSpec
return {
	src = "gh:saghen/blink.cmp",
	version = "v1.10.2",
	data = {
		config = function()
			require("blink.cmp").setup({
				keymap = {
					preset = "default",
					["H"] = { "show", "show_documentation", "hide_documentation" },
				},

				appearance = {
					nerd_font_variant = "mono",
				},

				completion = {
					documentation = {
						auto_show = true,
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
		end,
	},
}
