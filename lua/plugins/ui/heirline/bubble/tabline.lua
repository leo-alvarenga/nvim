return function()
	local utils = require("plugins.ui.heirline.utils")

	local TablineTabActive = utils.pill(utils.colors.accent, {
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
				fg = utils.colors.muted,
			},
		},

		TablineTabActive,
	}

	local TablineFile = utils.pill(function(self)
		if self.is_active or self.is_visible then
			return utils.colors.accent
		end

		return utils.colors.inactiveBg
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
			hl = { fg = utils.colors.accent },
		}
	end

	local Divider = { provider = " " }

	--- @diagnostic disable-next-line
	local TabList = utils.pill(function(self)
		return utils.colors.inactiveBg
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
