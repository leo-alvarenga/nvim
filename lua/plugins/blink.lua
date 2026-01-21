return {
	-- Completions
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets" },
	version = "1.*",
	opts = {
		keymap = {
			preset = "default",
			["<C-r>"] = { "show", "show_documentation", "hide_documentation" },
		},

		appearance = {
			nerd_font_variant = "mono",
		},

		completion = {
			documentation = {
				auto_show = true,
			},
			ghost_text = {
				enabled = true,
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
	},
	opts_extend = { "sources.default" },
}
