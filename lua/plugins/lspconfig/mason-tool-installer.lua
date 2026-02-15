local function get_mason_tool_installer()
	local _langs = require("values.languages")

	return {
		-- Manage all LSP and other tools
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			auto_update = true,

			ensure_installed = vim.tbl_extend(
				"force",
				_langs.lsps or {},
				_langs.formatters or {},
				_langs.linters or {}
			),

			integrations = {
				["mason-lspconfig"] = true,
			},

			run_on_start = true,
			start_delay = 5000,
		},
	}
end

return get_mason_tool_installer()
