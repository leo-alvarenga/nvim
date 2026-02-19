return {
	-- Better looking vim.ui_select replacement
	"nvim-mini/mini.pick",
	version = false,
	config = function()
		local pick = require("mini.pick")
		pick.setup({})

		vim.ui.select = pick.ui_select
	end,
}
