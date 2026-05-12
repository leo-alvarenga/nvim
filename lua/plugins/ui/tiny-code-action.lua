--- @type PluginSpec
return {
	name = "tiny-code-action",
	src = "gh:rachartier/tiny-code-action.nvim",
	data = {
		events = { "LspAttach" },
		keys = {
			{
				key = require("config.utils.keymap").with_prefix("a", "actions"),
				mode = { "n", "x" },
				desc = require("values.constants.shared").descriptions.code_action,
				command = function()
					require("tiny-code-action").code_action()
				end,
			},
		},
		config = function()
			require("tiny-code-action").setup({})
		end,
	},
}
