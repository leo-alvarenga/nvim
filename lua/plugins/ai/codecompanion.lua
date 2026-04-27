local _keymap = require("config.utils.keymap")

local map = _keymap.map
local with_prefix = _keymap.with_prefix

--- @type PluginSpec
return {
	src = "gh:olimorris/codecompanion.nvim",
	data = {
		config = function()
			local opts = {
				display = {
					chat = {
						fold_context = true,
						icons = {
							chat_context = "",
						},
					},
				},
				interactions = {
					chat = {
						adapter = {
							name = "copilot",
							model = "gpt-4.1",
						},
						callbacks = {
							["on_ready"] = {
								actions = {
									"interactions.background.builtin.chat_make_title",
								},
								enabled = true,
							},
						},
						opts = {
							-- Enable background interactions generally
							enabled = true,
						},
					},
					inline = {
						adapter = "copilot",
					},
					cmd = {
						adapter = "copilot",
					},
				},
			}

			require("codecompanion").setup(opts)

			local _shared = require("values.constants.shared")

			local to_cmd = _keymap.to_cmd

			-- Code Companion
			map("", with_prefix("", "ai"), "", _shared.descriptions.ai)

			map(
				"",
				with_prefix("a", "ai"),
				to_cmd(_shared.cmds.codecompanion.actions),
				_shared.descriptions.codecompanion.actions
			)

			map(
				"",
				with_prefix("c", "ai"),
				to_cmd(_shared.cmds.codecompanion.chat_toggle),
				_shared.descriptions.codecompanion.chat_toggle
			)
			map(
				"",
				with_prefix("n", "ai"),
				to_cmd(_shared.cmds.codecompanion.chat_new),
				_shared.descriptions.codecompanion.chat_new
			)

			map(
				"",
				with_prefix("p", "ai"),
				to_cmd(_shared.cmds.codecompanion.prompt),
				_shared.descriptions.codecompanion.prompt
			)
		end,
	},
}
