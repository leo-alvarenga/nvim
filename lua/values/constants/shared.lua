return {
	codecompanion = {
		actions = {
			cmd = "CodeCompanionActions",
		},
		chat = {
			toggle = {
				cmd = "lua require('codecompanion').toggle()",
			},
			new = {
				cmd = "CodeCompanionChat",
			},
		},
		prompt = {
			cmd = "CodeCompanion",
		},
	},
	colorizer = {
		toggle = {
			cmd = "ColorizerToggle",
		},
		attach = {
			cmd = "ColorizerToggle",
		},
		reload = {
			cmd = "ColorizerToggle",
		},
	},
	format = {
		notifications = {
			disabled = "[Conform] Format on save is now disabled",
			enabled = "[Conform] Format on save is now enabled",
			manual = "[Conform] Formatting current buffer",
		},
	},
	git = {
		blame = {
			cmd = "GitBlameToggle",
		},
	},
	lazy = {
		cmd = "Lazy",
		description = "Open plugin manager",
	},
	mason = {
		cmd = "Mason",
		description = "Manage LSP and tools",
	},
	neo_tree = {
		cmd = "Neotree toggle dir=./ reveal",
		description = "Tree view",
		notifications = {
			oil_warning = "[Neo-tree] Cannot open Neo-tree from Oil buffer",
		},
	},
	notify = {
		cmd = "NotificationsClear",
	},
	oil = {
		cmd = "Oil",
		description = "Browse files",
	},
	starter = {
		cmd = "MiniStarterOpen",
	},
	telescope = {
		find_files = {
			cmd = "Telescope find_files",
			description = "Find a file",
		},
		live_grep = {
			cmd = "Telescope live_grep",
			description = "Search in files",
		},
	},
	twilight = {
		cmd = "Twilight",
		notifications = {
			enabled = "[Twilight] Code block highlighting enabled",
			disabled = "[Twilight] Code block highlighting disabled",
		},
	},
	yank_history = {
		cmd = "Telescope yank_history",
	},

	misc = {
		quit = {
			cmd = "qa",
			description = "Quit Neovim",
		},

		edit_config = {
			cmd = "e $MYVIMRC",
			description = "Customize current Config",
		},
	},
}
