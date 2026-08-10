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

	mason = {
		manager = "Mason",
		logs = "MasonLog",
	},

	notify_clear = "NotificationsClear",

	starter = "MiniStarterOpen",

	telescope = {
		find_files = "Telescope find_files",
		live_grep = "Telescope live_grep",
	},

	twilight = "Twilight",

	yazi = {
		open = "Yazi",
		cwd = "Yazi cwd",
		toggle = "Yazi toggle",
	},

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

	mason = {
		manager = "Manage LSP and tools",
		logs = "View Mason logs",
	},

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

	yazi = {
		open = "Open Yazi at the current file",
		cwd = "Open Yazi in the current working directory",
		toggle = "Resume the last Yazi session",

		short = "Open Yazi",
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

	twilight = {
		enabled = "[Twilight] Code block highlighting enabled",
		disabled = "[Twilight] Code block highlighting disabled",
	},
}

M.colorschemes = {
	kanagawa = {
		statusBg = "#16161D", -- statusline background (darkest)
		pillText = "#16161D", -- text on colored pills
		pillBg = "#21222C", -- status pill background (git/diagnostics/fileinfo)
		inactiveBg = "#403B4A", -- inactive tab background (tabline)
		muted = "#2A2737", -- inactive tab number / dim text
		text = "#DCD7BA", -- default text / file name
		accent = "#957FB8", -- active tab / visual mode / decorators
		info = "#7E9CD8", -- normal mode / info diagnostics
		insert = "#76946A", -- insert mode
		warn = "#C0A36E", -- select mode / warn diagnostics
		error = "#E46876", -- command+terminal mode / error diagnostics
		menuBg = "#2A2737", -- completion menu background (blink)
		selection = "#2D4F67", -- completion selection highlight (blink)
	},

	-- Currently active theme (lua/values/ui.lua -> M.theme). Colors mirror
	-- the tmux statusbar (see ~/.config/tmux/everforest.conf).
	everforest = {
		statusBg = "#232A2E", -- tmux bgMain / bg_dim (status bar bg)
		pillText = "#2D353B", -- tmux bg0 (text on accents)
		pillBg = "#3D484D", -- tmux bg2 (status-right pill bg)
		inactiveBg = "#3D484D", -- tmux bg2 (inactive tabs)
		muted = "#7A8472", -- tmux grey0
		text = "#D3C6AA", -- tmux statusline2 / fg
		accent = "#A7C080", -- tmux statusline1 (green)
		info = "#7FBBB3", -- tmux blue
		insert = "#A7C080", -- tmux green (accent)
		warn = "#DBBC7F", -- tmux yellow
		error = "#E67E80", -- tmux red
		menuBg = "#3D484D", -- tmux bg2
		selection = "#A7C080", -- tmux green (accent)
	},
}

-- Resolved palette for the theme selected in lua/values/ui.lua
M.colors = M.colorschemes[require("values.ui").theme] or M.colorschemes.kanagawa

return M
