local _table = require("utils.table")

local function get_mason_tool_installer()
	local _langs = require("utils.config"):get("development").languages or {}

	return {
		-- Manage all LSP and other tools
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			auto_update = true,

			ensure_installed = _table.merge_arrays({
				_langs.lsps or nil,
				_langs.formatters or nil,
				_langs.linters or nil,
			}),

			integrations = {
				["mason-lspconfig"] = true,
			},

			run_on_start = true,
			start_delay = 5000,
		},
	}
end

return get_mason_tool_installer()
