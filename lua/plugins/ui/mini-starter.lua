local _shared = require("utils.constants.shared")

local sections = {
	files = "  Files",
	config = "  Config",
	plugins = " Plugins and LSPs",
	exit = "  Exit",
}

--- ASCII art banner for mini.starter
local function banner()
	return table.concat({
		[[                                                     ]],
		[[  ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓ ]],
		[[  ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒ ]],
		[[ ▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░ ]],
		[[ ▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██  ]],
		[[ ▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒ ]],
		[[ ░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░ ]],
		[[ ░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░ ]],
		[[    ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░    ]],
		[[          ░    ░  ░    ░ ░        ░   ░         ░    ]],
		[[                                 ░                   ]],
	}, "\n")
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
				name = "Browse files",
				section = sections.files,
			},
			{
				action = _shared.neo_tree.cmd,
				name = "Tree view",
				section = sections.files,
			},
			{
				action = _shared.telescope.find_files.cmd,
				name = "Find a file",
				section = sections.files,
			},
			{
				action = _shared.telescope.live_grep.cmd,
				name = "Search in files",
				section = sections.files,
			},
			{
				action = "e $MYVIMRC",
				name = "Customize current Config",
				section = sections.config,
			},
			{
				action = "Lazy",
				name = "Open Plugin Manager",
				section = sections.plugins,
			},
			{
				action = "Mason",
				name = "Manage LSPs and Tools",
				section = sections.plugins,
			},
			{
				action = "qa",
				name = "Quit Neovim",
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
