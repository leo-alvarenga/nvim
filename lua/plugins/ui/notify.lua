--- @type PluginSpec
return {
	name = "notify",
	src = "gh:rcarriga/nvim-notify",
	data = {
		config = function()
			local notify = require("notify")

			notify.setup({
				stages = "static",
				timeout = 3000,
			})
			vim.notify = notify
		end,
	},
}
