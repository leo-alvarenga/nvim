local M = {}

M.cmds = {
	buffers = {
		buf_next = "bnext",
		buf_prev = "bprev",
	},

	codecompanion = {
		actions = "CodeCompanionActions",
		chat_toggle = "lua require('codecompanion').toggle()",
		chat_new = "CodeCompanionChat",
		prompt = "CodeCompanion",
	},

	copilot_chat = {
		chat_toggle = "CopilotChatToggle",
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

	guess_indent = "GuessIndent",

	homecoming = {
		buffer_delete = "HomecomingCloseCurrBuf",
	},

	mantel = {
		buf_next = "MantelBufNext",
		buf_prev = "MantelBufPrev",
		move_buf_left = "MantelMoveBufLeft",
		move_buf_right = "MantelMoveBufRight",
	},

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

	-- misc
	quit = "qa",
	edit_config = "e $MYVIMRC",
}

M.descriptions = {
	-- Sections
	actions = "   Misc actions",
	ai = "   AI actions",
	general = "   General",
	tabs = " 󰓩  Tabs",

	buffers = {
		new = "Open new empty Buffer",
		buf_next = "Go to next buffer in the tabline",
		buf_prev = "Go to previous buffer in the tabline",
	},

	code_action = "Perform a code action",

	codecompanion = {
		actions = "See all Code Companion actions",
		chat_toggle = "Toggle Code Companion chat",
		chat_new = "Start a new Code Companion chat",
		prompt = "Toggle Code Companion prompt",
	},

	copilot_chat = {
		chat_toggle = "Toggle Copilot chat",
	},

	diffview = {
		open = "Open Diffview",
		close = "Close Diffview",
		toggle = "Toggle Diffview",
	},

	edit_config = "Customize current Config",

	git_blame = "Toggle Git Blame",

	homecoming = {
		buffer_delete = "Close current buffer from Homecoming",
	},

	lsp = {
		hover = "Show LSP hover information",
		signature_help = "Show LSP signature help",
	},

	mantel = {
		buf_next = "Go to next buffer in the tabline",
		buf_prev = "Go to previous buffer in the tabline",
		move_buf_left = "Move current buffer left in the tabline",
		move_buf_right = "Move current buffer right in the tabline",
	},

	mason = {
		manager = "Manage LSP and tools",
		logs = "View Mason logs",
	},

	neo_tree = {
		tree = "Tree view",
		long_desc = "Explore current directory using Neotree",
	},

	oil = "Explore current directory using Oil",

	quit = "Quit Neovim",

	restart = "Restart Neovim",

	tab = {
		new = "Open new empty Tab",
		next = "Go to next Tab",
		prev = "Go to previous Tab",
		close = "Close current Tab",
		only = "Close all tabs (except for the current one)",
	},

	telescope = {
		find_files = "Find a file",
		live_grep = "Search in files",
	},
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

M.colors = {
	sumiInk0 = "#16161D",
	sumiInk1 = "#21222C",
	sumiInk2 = "#403B4A",
	sumiInk3 = "#1F1F28",
	sumiInk4 = "#2A2737",
	crystalBlue = "#7E9CD8",
	springGreen = "#76946A",
	oniViolet = "#957FB8",
	fujiWhite = "#DCD7BA",
	autumnRed = "#E46876",
	boatYellow = "#C0A36E",
	waveBlue2 = "#2D4F67",
}

return M
