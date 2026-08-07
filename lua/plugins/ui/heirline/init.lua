--- @type PluginSpec
return {
	name = "heirline",
	src = "gh:rebelot/heirline.nvim",
	data = {
		config = function()
			-- Style: "bubble" (rounded pills) or "powerline" (slanted)
			-- Switch in lua/values/ui.lua (M.bar_style)
			local ui = require("values.ui")
			local style = ui.bar_style or "bubble"

			assert(
				style == "bubble" or style == "powerline",
				string.format("values.ui.bar_style: invalid style '%s' (expected 'bubble' or 'powerline')", style)
			)

			local get_statusline = require("plugins.ui.heirline." .. style .. ".statusline")
			local get_tabline = require("plugins.ui.heirline." .. style .. ".tabline")

			vim.o.showtabline = 2

			require("heirline").setup({ statusline = get_statusline(), tabline = get_tabline() })

			local keymap = require("config.utils.keymap")
			local _shared = require("values.constants.shared")
			local map = keymap.map

			map(
				"",
				keymap.with_prefix("h", "buffers"),
				keymap.to_cmd(_shared.cmds.buffers.buf_prev),
				_shared.descriptions.buffers.buf_prev
			)

			map(
				"",
				keymap.with_prefix("l", "buffers"),
				keymap.to_cmd(_shared.cmds.buffers.buf_next),
				_shared.descriptions.buffers.buf_next
			)
		end,
	},
}
