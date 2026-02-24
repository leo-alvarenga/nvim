return {
	-- Notifications and feedback
	"rcarriga/nvim-notify",
	branch = false,
	config = function()
		local notify = require("notify")

		notify.setup({})
		vim.notify = notify
	end,
}
