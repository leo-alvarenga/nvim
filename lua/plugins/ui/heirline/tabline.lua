return function()
	local utils = require("plugins.ui.heirline.utils")

	local TablineFile = utils.to_kanagawa_pill(function(self)
		if self.is_active or self.is_visible then
			return utils.colors.oniViolet
		end

		return utils.colors.sumiInk2
	end, {
		provider = function(self)
			local icon = utils.filetype_icon(self.bufnr)

			local filename = vim.api.nvim_buf_get_name(self.bufnr)
			filename = filename == "" and "[No Name]" or vim.fn.fnamemodify(filename, ":t")

			local modified = vim.fn.getbufinfo(self.bufnr)[1].changed == 1
			local modified_icon = modified and " ●" or ""

			return string.format("%s %s%s", icon, filename, modified_icon)
		end,
		hl = function(self)
			return { bold = self.is_active or self.is_visible, italic = self.is_active or self.is_visible }
		end,
	})

	return {
		--- @diagnostic disable-next-line
		require("heirline.utils").make_buflist({
			TablineFile,
			{ provider = " " },
		}),

		{ provider = "%=" },
	}
end
