return {
	starter = {
		cmd = "MiniStarterOpen",
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
	telescope = {
		find_files = {
			cmd = "Telescope find_files",
		},
		live_grep = {
			cmd = "Telescope live_grep",
		},
		workspaces = {
			cmd = "Telescope workspaces",
		},
	},
	twilight = {
		cmd = "Twilight",
		notifications = {
			enabled = "[Twilight] Code block highlighting enabled",
			disabled = "[Twilight] Code block highlighting disabled",
		},
	},
}
