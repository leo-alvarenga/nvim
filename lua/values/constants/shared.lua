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
	neo_tree = {
		cmd = "Neotree toggle dir=./ reveal",
		notifications = {
			oil_warning = "[Neo-tree] Cannot open Neo-tree from Oil buffer",
		},
	},
	oil = {
		cmd = "Oil",
	},
	starter = {
		cmd = "MiniStarterOpen",
	},
	telescope = {
		find_files = {
			cmd = "Telescope find_files",
		},
		live_grep = {
			cmd = "Telescope live_grep",
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
}
