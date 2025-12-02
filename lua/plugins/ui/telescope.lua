return {
	-- A whole bunch of file pickers
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
	version = false,
	config = function()
		local map = require("utils.keymap").map
		local _shared = require("utils.constants.shared")
		local _workspaces = require("utils.workspaces")

		local telescope = require("telescope")

		local telescope_picker_opts = {
			theme = "dropdown",
		}

		telescope.setup({
			buffers = telescope_picker_opts,
			fd = telescope_picker_opts,
			grapple = telescope_picker_opts,
			help_tags = telescope_picker_opts,
			live_grep = telescope_picker_opts,
			workspaces = telescope_picker_opts,
		})

		local builtin = require("telescope.builtin")

		map("n", "<leader>f", function()
			builtin.fd({ hidden = true })
		end, "Telescope - Find files")

		map("", "<leader>g", builtin.git_files, "Telescope - Git files")

		map("", "<leader>F", function()
			builtin.live_grep({ hidden = true })
		end, "Telescope - Live grep")

		map("", "<leader>c", builtin.buffers, "Telescope - Buffers")

		map("", "<leader>C", builtin.help_tags, "Telescope - help tags")
		map("", "<leader>w", ":" .. _shared.telescope.workspaces.cmd .. "<CR>", "Telescope - Workspaces")

		map("", "<leader>M", ":Telescope grapple tags<cr>", "Telescope - Open Grapple tags window")
		map("", "<leader>W", _workspaces.manage_workspaces, "Telescope - Manage workspaces")

		telescope.load_extension("grapple")
		telescope.load_extension("workspaces")
	end,
}
