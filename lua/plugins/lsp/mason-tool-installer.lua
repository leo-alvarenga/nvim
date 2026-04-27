--- @type PluginSpec
return {
	name = "mason-tool-installer",
	src = "gh:WhoIsSethDaniel/mason-tool-installer.nvim",
	data = {
		config = function()
			local _langs = require("values.languages")

			require("mason-tool-installer").setup({
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
			})
		end,
	},
}
