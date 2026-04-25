--- @type PluginSpec
return {
	name = "todo-comments",
	src = "gh:folke/todo-comments.nvim",
	data = {
		config = function()
			require("todo-comments").setup({})
		end,
	},
}
