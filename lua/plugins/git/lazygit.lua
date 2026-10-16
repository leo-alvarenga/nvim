--- @type PluginSpec
return {
	cmd = "LazyGit",
	name = "lazygit",
	src = "gh:kdheepak/lazygit.nvim",
	data = {
		config = function()
			vim.g.lazygit_date_format = "%Y-%m-%d %H:%M:%S"
		end,
	},
}
