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
		require("plugins.theme"),
	}

	for _, tbl in ipairs({
		require("plugins.treesitter"),
		require("plugins.lsp"),
		require("plugins.code-completions"),
		require("plugins.ai"),
		require("plugins.git"),
		require("plugins.ui"),
		require("plugins.ux"),
		require("plugins.misc"),
	}) do
		for _, v in ipairs(tbl) do
			table.insert(plugins, v)
		end
	end

	return plugins
end

return M
