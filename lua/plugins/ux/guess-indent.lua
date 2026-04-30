--- @type PluginSpec
return {
	name = "guess-indent",
	src = "gh:NMAC427/guess-indent.nvim",
	data = {
		config = function()
			require("guess-indent").setup({
				auto_cmd = true,
			})

			vim.api.nvim_command("filetype indent off")
		end,
	},
}
