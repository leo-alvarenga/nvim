--- @type PluginSpec
return {
	name = "bufferline",
	src = "gh:akinsho/bufferline.nvim",
	data = {
		config = function()
			local bufferline = require("bufferline")

			bufferline.setup({
				options = {
					mode = "buffers",
					style_preset = bufferline.style_preset.default,
					separator_style = "slope",
					buffer_close_icon = "",
					close_icon = "",
				},
			})

			local keymap = require("config.utils.keymap")
			local map = keymap.map

			map("", keymap.with_prefix("h", "general"), ":BufferLineCyclePrev<CR>", "Go to previous Buffer")
			map("", keymap.with_prefix("l", "general"), ":BufferLineCycleNext<CR>", "Go to next Buffer")
		end,
	},
}
