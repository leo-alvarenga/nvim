return {
	-- Manage Dirs as workspaces
	"natecraddock/workspaces.nvim",
	opts = {
		hooks = {
			open = { require("utils.workspaces").on_open },
		},
	},
	version = false,
}
