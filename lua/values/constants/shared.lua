local M = {}

M.cmds = {
	codecompanion = {
		actions = "CodeCompanionActions",
		chat_toggle = "lua require('codecompanion').toggle()",
		chat_new = "CodeCompanionChat",
		prompt = "CodeCompanion",
	},

	colorizer = {
		toggle = "ColorizerToggle",
		attach = "ColorizerToggle",
		reload = "ColorizerToggle",
	},

	diffview = {
		open = "DiffviewOpen",
		close = "DiffviewClose",
	},

	git_blame = "GitBlameToggle",

	homecoming = {
		buffer_delete = "HomecomingCloseCurrBuf",
	},

	lazy = "Lazy",

	mason = {
		manager = "Mason",
		logs = "MasonLog",
	},

	neo_tree = "Neotree toggle dir=./ reveal",

	notify_clear = "NotificationsClear",

	oil = "Oil",

	starter = "MiniStarterOpen",

	telescope = {
		find_files = "Telescope find_files",
		live_grep = "Telescope live_grep",
	},

	twilight = "Twilight",

	yank_history = "Telescope yank_history",

	-- misc
	quit = "qa",
	edit_config = "e $MYVIMRC",
}

M.descriptions = {
	ai = "   AI actions",
	codecompanion = {
		actions = "See all Code Companion actions",
		chat_toggle = "Toggle Code Companion chat",
		chat_new = "Start a new Code Companion chat",
		prompt = "Toggle Code Companion prompt",
	},

	diffview = {
		open = "Open Diffview",
		close = "Close Diffview",
		toggle = "Toggle Diffview",
	},

	git_blame = "Toggle Git Blame",

	homecoming = {
		buffer_delete = "Close current buffer from Homecoming",
	},

	lazy = "Open plugin manager",

	mason = {
		manager = "Manage LSP and tools",
		logs = "View Mason logs",
	},

	neo_tree = {
		tree = "Tree view",
		long_desc = "Explore current directory using Neotree",
	},

	oil = {
		browse = "Browse files",
		long_desc = "Manage the current directory using Oil",
	},

	starter = "Open Mini Starter",

	telescope = {
		find_files = "Find a file",
		live_grep = "Search in files",
	},

	quit = "Quit Neovim",
	edit_config = "Customize current Config",
}

M.notifications = {
	diffview = {
		open = "[Diffview] Diffview opened",
		close = "[Diffview] Diffview closed",
	},

	format = {
		enabled = "[Conform] Format on save is now enabled",
		disabled = "[Conform] Format on save is now disabled",
		manual = "[Conform] Formatting current buffer",
	},

	neo_tree = {
		oil_warning = "[Neo-tree] Cannot open Neo-tree from Oil buffer",
	},

	twilight = {
		enabled = "[Twilight] Code block highlighting enabled",
		disabled = "[Twilight] Code block highlighting disabled",
	},
}

return M
