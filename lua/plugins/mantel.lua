return {
	"leo-alvarenga/mantel.nvim",
	-- dir = "~/personal/mantel.nvim",
	branch = "nightly",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local mantel = require("mantel-nvim")

		local opts = {
			mode = "enhanced",
		}

		mantel.setup(opts)

		local _keymap = require("config.utils.keymap")
		local _shared = require("values.constants.shared")

		local map = _keymap.map
		local with_prefix = _keymap.with_prefix

		map(
			"",
			with_prefix("h", "buffers"),
			_keymap.to_cmd(_shared.cmds.mantel.buf_prev),
			_shared.descriptions.mantel.buf_prev
		)

		map(
			"",
			with_prefix("l", "buffers"),
			_keymap.to_cmd(_shared.cmds.mantel.buf_next),
			_shared.descriptions.mantel.buf_next
		)

		map(
			"",
			with_prefix("H", "buffers"),
			_keymap.to_cmd(_shared.cmds.mantel.move_buf_left),
			_shared.descriptions.mantel.move_buf_left
		)

		map(
			"",
			with_prefix("L", "buffers"),
			_keymap.to_cmd(_shared.cmds.mantel.move_buf_right),
			_shared.descriptions.mantel.move_buf_right
		)
	end,
}
