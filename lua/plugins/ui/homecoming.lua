--- @type PluginSpec
return {
	name = "homecoming-nvim",
	src = "gh:leo-alvarenga/homecoming.nvim",
	version = "nightly",
	data = {
		config = function()
			local _ui = require("values.ui")
			local _shared = require("values.constants.shared")

			local sections = {
				files = "  Files",
				plugins = "󱁤  LSPs and Tools",
				exit = "  Exit",
			}

			local opts = {
				header = _ui.banner,
				header_mb = 1,

				footer_mt = 1,
				footer_hl_group = "Constant",
				footer = function()
					local plugins = require("plugins.helpers").get_plugins()

					return {
						"󰏖  vim.pack   " .. tostring(#plugins) .. " plugins",
					}
				end,

				item_indent = 3,

				section_anchor = "header_half",
				sections = {
					{
						title = sections.files,
						items = {
							{
								action = _shared.cmds.neo_tree,
								label = _shared.descriptions.neo_tree.tree,
								section = sections.files,
							},
							{
								action = _shared.cmds.telescope.find_files,
								label = _shared.descriptions.telescope.find_files,
								section = sections.files,
							},
						},
					},
					{
						title = sections.plugins,
						items = {
							{
								action = _shared.cmds.mason.manager,
								label = _shared.descriptions.mason.manager,
								section = sections.plugins,
							},
						},
					},
					{
						title = sections.exit,
						items = {
							{ action = _shared.cmds.quit, label = _shared.descriptions.quit },
						},
					},
				},
			}

			require("homecoming-nvim").setup(opts)

			local _keymap = require("config.utils.keymap")

			local map = _keymap.map
			local with_prefix = _keymap.with_prefix

			-- Close current Buffer
			map(
				"",
				with_prefix("q", "buffers"),
				_keymap.to_cmd(_shared.cmds.homecoming.buffer_delete),
				_shared.descriptions.homecoming.buffer_delete
			)
		end,
	},
}
