return {
	-- Toggleable block highlights for enhanced readability
	"folke/twilight.nvim",
	config = function()
		local _keymap = require("utils.keymap")
		local map = _keymap.map
		local with_prefix = _keymap.with_prefix

		local twilight = require("utils.twilight")

		map("", with_prefix("w", "actions"), twilight.toggle_twilight, "Toggle Twilight dim")
	end,
	version = false,
}
