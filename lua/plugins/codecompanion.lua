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

return {
	"olimorris/codecompanion.nvim",
	enabled = require("values.plugins").is_enabled("codecompanion"),
	version = "^18.0.0",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},

	config = function()
		require("codecompanion").setup(opts)

		local _keymap = require("config.utils.keymap")
		local _shared = require("values.constants.shared")

		local map = _keymap.map
		local with_prefix = _keymap.with_prefix
		local to_cmd = _keymap.to_cmd

		-- Code Companion
		map("", with_prefix("", "ai"), "", _shared.descriptions.ai)

		map(
			"",
			with_prefix("a", "ai"),
			to_cmd(_shared.cmds.codecompanion.actions, "codecompanion"),
			_shared.descriptions.codecompanion.actions
		)

		map(
			"",
			with_prefix("c", "ai"),
			to_cmd(_shared.cmds.codecompanion.chat_toggle, "codecompanion"),
			_shared.descriptions.codecompanion.chat_toggle
		)
		map(
			"",
			with_prefix("n", "ai"),
			to_cmd(_shared.cmds.codecompanion.chat_new, "codecompanion"),
			_shared.descriptions.codecompanion.chat_new
		)

		map(
			"",
			with_prefix("p", "ai"),
			to_cmd(_shared.cmds.codecompanion.prompt, "codecompanion"),
			_shared.descriptions.codecompanion.prompt
		)
	end,
}
