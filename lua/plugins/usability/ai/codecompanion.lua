local function get_codecompanion()
	local codecompanion_enabled = require("utils.config"):get("toggles").codecompanion or false

	if not codecompanion_enabled then
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
			interactions = {
				chat = {
					adapter = {
						name = "copilot",
						model = "gpt-4.1",
					},
				},
				inline = {
					adapter = "copilot",
				},
				cmd = {
					adapter = "anthropic",
				},
			},
		},
	}
end

return get_codecompanion()
