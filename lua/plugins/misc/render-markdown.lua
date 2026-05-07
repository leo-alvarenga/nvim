--- @type PluginSpec
return {
	name = "render-markdown",
	src = "gh:MeanderingProgrammer/render-markdown.nvim",
	data = {
		config = function()
			require("render-markdown").setup({
				code = {
					style = "language",
				},
			})
		end,
	},
}
