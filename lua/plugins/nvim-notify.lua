return {
	-- Notifications and feedback
	"rcarriga/nvim-notify",
	branch = false,
	config = function()
		require("notify").setup({})

		vim.notify = require("notify")
	end,
}
