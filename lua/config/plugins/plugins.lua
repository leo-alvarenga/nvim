local M = {}

--- @return PluginSpec[]
function M.get_plugins()
	--- @type PluginSpec[]
	local plugins = {
		--- Dependencies
		{ src = "gh:nvim-lua/plenary.nvim" },
		{ src = "gh:rafamadriz/friendly-snippets" },
		{ src = "gh:nvim-tree/nvim-web-devicons" },
		{ src = "gh:nvimtools/none-ls-extras.nvim" },
		{ src = "gh:MunifTanjim/nui.nvim" },

		{ src = "gh:kevinhwang91/promise-async" },

		--- Theme
		require("config.plugins.plugins.theme"),
	}

	for _, tbl in ipairs({
		require("config.plugins.plugins.treesitter"),
		require("config.plugins.plugins.lsp"),
		require("config.plugins.plugins.code-completions"),
		require("config.plugins.plugins.ai"),
		require("config.plugins.plugins.git"),
		require("config.plugins.plugins.ui"),
		require("config.plugins.plugins.ux"),
		require("config.plugins.plugins.misc"),
	}) do
		for _, v in ipairs(tbl) do
			table.insert(plugins, v)
		end
	end

	return plugins
end

return M
