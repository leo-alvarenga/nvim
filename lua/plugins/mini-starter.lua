local _ui = require("values.ui")
local _shared = require("values.constants.shared")

local sections = {
	files = "  Files",
	config = "  Config",
	plugins = " Plugins and LSPs",
	exit = "  Exit",
}

--- ASCII art banner for mini.starter
local function banner()
	return table.concat(_ui.banner, "\n")
end

--- Get a random quote from quoth-nvim
local function footer()
	local quote = require("quoth-nvim").get_random_quote()
	return '"' .. quote.text .. '"\n' .. quote.author
end

return {
	"nvim-mini/mini.starter",
	version = false,
	opts = {
		autoopen = true,
		evaluate_single = false,
		items = {
			{
				action = _shared.cmds.oil,
				name = _shared.descriptions.oil.browse,
				section = sections.files,
			},
			{
				action = _shared.cmds.neo_tree,
				name = _shared.descriptions.neo_tree.tree,
				section = sections.files,
			},
			{
				action = _shared.cmds.telescope.find_files,
				name = _shared.descriptions.telescope.find_files,
				section = sections.files,
			},
			{
				action = _shared.cmds.telescope.live_grep,
				name = _shared.descriptions.telescope.live_grep,
				section = sections.files,
			},
			{
				action = _shared.cmds.edit_config,
				name = _shared.descriptions.edit_config,
				section = sections.config,
			},
			{
				action = _shared.cmds.lazy,
				name = _shared.descriptions.lazy,
				section = sections.plugins,
			},
			{
				action = _shared.cmds.mason.manager,
				name = _shared.descriptions.mason.manager,
				section = sections.plugins,
			},
			{
				action = _shared.cmds.quit,
				name = _shared.descriptions.quit,
				section = sections.exit,
			},
		},
		header = banner,
		footer = footer,
		content_hooks = nil,
		query_updaters = "abcdefghijklmnopqrstuvwxyz0123456789_-.",
		silent = true,
	},
}
