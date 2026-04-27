--- @type PluginSpec
return {
	name = "notify",
	src = "gh:rcarriga/nvim-notify",
	data = {
		config = function()
			local notify = require("notify")

			notify.setup({})
			vim.notify = notify
		end,
	},
}
