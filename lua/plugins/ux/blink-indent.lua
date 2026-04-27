--- @type PluginSpec
return {
	src = "gh:saghen/blink.indent",
	data = {
		config = function()
			require("blink-indent").setup({})
		end,
	},
}
