--- @type PluginSpec
return {
	name = "CopilotChat",
	src = "gh:CopilotC-Nvim/CopilotChat.nvim",
	data = {
		config = function()
			require("CopilotChat").setup()

			local _keymap = require("config.utils.keymap")
			local _shared = require("values.constants.shared")

			local map = _keymap.map
			local with_prefix = _keymap.with_prefix

			local to_cmd = _keymap.to_cmd

			map(
				"",
				with_prefix("g", "ai"),
				to_cmd(_shared.cmds.copilot_chat.chat_toggle),
				_shared.descriptions.copilot_chat.chat_toggle
			)
		end,
	},
}
