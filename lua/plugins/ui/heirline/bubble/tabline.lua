return function()
	local utils = require("plugins.ui.heirline.shared.providers")
	local style = require("plugins.ui.heirline.shared.style")
	local colors = require("plugins.ui.heirline.shared.constants").colors

	local TablineTabActive = style.pill(colors.accent, {
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
				fg = colors.muted,
			},
		},

		TablineTabActive,
	}

	local TablineFile = style.pill(function(self)
		if self.is_active or self.is_visible then
			return colors.accent
		end

		return colors.inactiveBg
	end, {
		provider = function(self)
			local icon, filename = utils.buffer_label(self.bufnr)

			local modified_icon = utils.buffer_modified(self.bufnr) and " ●" or ""

			return string.format("%s %s%s", icon, filename, modified_icon)
		end,
		hl = function(self)
			return { bold = self.is_active or self.is_visible, italic = self.is_active or self.is_visible }
		end,
	})

	local Divider = { provider = " " }

	--- @diagnostic disable-next-line
	local TabList = style.pill(function(self)
		return colors.inactiveBg
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
	}, style.trunc(" "), style.trunc(" "))

	return {
		BufferList,
		{ provider = "%=" },
		TabList,
	}
end