local function get_codecompanion()
	if not require("utils.config"):is_enabled("plugins", "codecompanion") then
		return {}
	end

	return {
		"olimorris/codecompanion.nvim",
		version = "^18.0.0",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
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
		},
	}
end

return get_codecompanion()
