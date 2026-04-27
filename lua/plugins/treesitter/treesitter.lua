--- @type PluginSpec
return {
	name = "nvim-treesitter",
	version = "main",
	src = "gh:nvim-treesitter/nvim-treesitter",
	data = {
		config = function()
			local ensureInstalled = require("values.languages").languages
			local alreadyInstalled = require("nvim-treesitter.config").get_installed()

			local parsersToInstall = vim.iter(ensureInstalled)
				:filter(function(parser)
					return not vim.tbl_contains(alreadyInstalled, parser)
				end)
				:totable()

			require("nvim-treesitter").install(parsersToInstall)

			vim.api.nvim_create_autocmd("FileType", {
				callback = function()
					pcall(vim.treesitter.start)
					vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end,
			})
		end,
	},
}
