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
	return require("quoth-nvim").get_random_quote().text
end

return {
	"nvim-mini/mini.starter",
	version = false,
	opts = {
		autoopen = true,
		evaluate_single = false,
		items = {
			{
				action = _shared.oil.cmd,
				name = _shared.oil.description,
				section = sections.files,
			},
			{
				action = _shared.neo_tree.cmd,
				name = _shared.neo_tree.description,
				section = sections.files,
			},
			{
				action = _shared.telescope.find_files.cmd,
				name = _shared.telescope.find_files.description,
				section = sections.files,
			},
			{
				action = _shared.telescope.live_grep.cmd,
				name = _shared.telescope.live_grep.description,
				section = sections.files,
			},
			{
				action = _shared.misc.edit_config.cmd,
				name = _shared.misc.edit_config.description,
				section = sections.config,
			},
			{
				action = _shared.lazy.cmd,
				name = _shared.lazy.description,
				section = sections.plugins,
			},
			{
				action = _shared.mason.cmd,
				name = _shared.mason.description,
				section = sections.plugins,
			},
			{
				action = _shared.misc.quit.cmd,
				name = _shared.misc.quit.description,
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
