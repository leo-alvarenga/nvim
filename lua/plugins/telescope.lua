return {
	-- A whole bunch of file pickers
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
	version = false,
	config = function()
		local _keymap = require("config.utils.keymap")

		local map = _keymap.map
		local with_prefix = _keymap.with_prefix

		local telescope = require("telescope")

		local telescope_picker_opts = {
			theme = "dropdown",
		}

		telescope.setup({
			buffers = telescope_picker_opts,
			fd = telescope_picker_opts,
			help_tags = telescope_picker_opts,
			live_grep = telescope_picker_opts,
		})

		local builtin = require("telescope.builtin")

		map("n", with_prefix("f", "pickers"), function()
			builtin.fd({ hidden = true })
		end, "Telescope - Find files")

		map("", with_prefix("G", "pickers"), builtin.git_files, "Telescope - Git files")

		map("", with_prefix("F", "pickers"), function()
			builtin.live_grep({ hidden = true })
		end, "Telescope - Live grep")

		map("", with_prefix("c", "pickers"), builtin.buffers, "Telescope - Buffers")

		map("", with_prefix("C", "pickers"), builtin.help_tags, "Telescope - help tags")
	end,
}
