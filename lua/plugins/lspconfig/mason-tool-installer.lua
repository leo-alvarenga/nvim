local _langs = require("utils.constants.languages")
local _table = require("utils.table")

return {
	-- Manage all LSP and other tools
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	opts = {
		auto_update = true,

		ensure_installed = _table.merge_arrays({
			_langs.lang_server_list,

			_langs.formatters.basics,
			_langs.formatters.devops_and_infra,
			_langs.formatters.web_dev,

			_langs.linters.basics,
			_langs.linters.devops_and_infra,
			_langs.linters.web_dev,
		}),

		integrations = {
			["mason-lspconfig"] = true,
		},

		run_on_start = true,
		start_delay = 5000,
	},
}
