return {
	-- Toggleable block highlights for enhanced readability
	"folke/twilight.nvim",
	config = function()
		local map = require("utils.keymap").map
		local twilight = require("utils.twilight")

		map("", "<C-e>", twilight.toggle_twilight, "Toggle Twilight dim")
	end,
	version = false,
}
