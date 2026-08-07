return function()
	local utils = require("plugins.ui.heirline.utils")

	local TablineTabActive = utils.to_kanagawa_pill(utils.colors.oniViolet, {
		provider = function(self)
			return tostring(self.tabnr)
		end,
		hl = { bold = true },
	})

	TablineTabActive.condition = function(self)
		return self.is_active
	end

	local TablineTab = {
		{
			condition = function(self)
				return not self.is_active
			end,
			provider = function(self)
				return string.format(" %s ", self.tabnr)
			end,
			hl = {
				fg = utils.colors.sumiInk4,
			},
		},

		TablineTabActive,
	}

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

	--- @param provider function|string
	local get_trunc = function(provider)
		return {
			provider = provider,
			hl = { fg = utils.colors.oniViolet },
		}
	end

	local Divider = { provider = " " }

	--- @diagnostic disable-next-line
	local TabList = utils.to_kanagawa_pill(function(self)
		return utils.colors.sumiInk2
	end, {
		--- @diagnostic disable-next-line
		require("heirline.utils").make_tablist({ TablineTab }),
	})

	TabList.condition = function()
		return #vim.api.nvim_list_tabpages() > 1
	end

	--- @diagnostic disable-next-line
	local BufferList = require("heirline.utils").make_buflist({
		TablineFile,
		Divider,
	}, get_trunc(" "), get_trunc(" "))

	return {
		BufferList,
		{ provider = "%=" },
		TabList,
	}
end
