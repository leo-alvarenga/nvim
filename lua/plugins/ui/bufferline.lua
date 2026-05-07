--- @type PluginSpec
return {
	name = "bufferline",
	src = "gh:akinsho/bufferline.nvim",
	data = {
		config = function()
			local bufferline = require("bufferline")

			local opts = {
				options = {
					mode = "buffers",
					style_preset = bufferline.style_preset.default,
					separator_style = "slant",
					buffer_close_icon = "",
					close_icon = "",
				},
			}

			bufferline.setup(opts)

			local keymap = require("config.utils.keymap")
			local _shared = require("values.constants.shared")
			local map = keymap.map

			----------------------------------------------------
			-- Navigation

			map(
				"",
				keymap.with_prefix("h", "buffers"),
				keymap.to_cmd(_shared.cmds.bufferline.buf_prev),
				_shared.descriptions.bufferline.buf_prev
			)

			map(
				"",
				keymap.with_prefix("l", "buffers"),
				keymap.to_cmd(_shared.cmds.bufferline.buf_next),
				_shared.descriptions.bufferline.buf_next
			)

			----------------------------------------------------
			-- Movement

			map(
				"",
				keymap.with_prefix("H", "buffers"),
				keymap.to_cmd(_shared.cmds.bufferline.move_buf_left),
				_shared.descriptions.bufferline.move_buf_left
			)

			map(
				"",
				keymap.with_prefix("L", "buffers"),
				keymap.to_cmd(_shared.cmds.bufferline.move_buf_right),
				_shared.descriptions.bufferline.move_buf_right
			)

			----------------------------------------------------

			vim.api.nvim_create_autocmd("ColorScheme", {
				callback = function()
					require("bufferline").setup(opts)
				end,
			})
		end,
	},
}
