return function()
	local utils = require("plugins.ui.heirline.shared.providers")
	local style = require("plugins.ui.heirline.shared.style")
	local consts = require("plugins.ui.heirline.shared.constants")

	local colors = consts.colors

	local Divider = { provider = " " }

	-- LeftDecorator (tmux session chip): flush accent block, closing wedge.
	local LeftDecorator = style.surround({ provider = "  " }, "", "", consts.mode_colors.n)

	-- Buffer/File entry: accent block when active, muted block otherwise.
	-- Mirrors classic.conf window-status-current-format / window-status-format:
	-- dark notch, " icon  (U+E0B1)  name " content, closing wedge.
	-- The modified dot  is the analog of the tmux zoomed flag: active only.
	local TablineFile = style.surround(
		{
			provider = function(self)
				local icon, filename = utils.buffer_label(self.bufnr)

				local modified = ""
				if self.is_active and utils.buffer_modified(self.bufnr) then
					modified = " ●"
				end

				return string.format(" %s %s %s%s ", icon, "", filename, modified)
			end,
			hl = function(self)
				return { bold = self.is_active or self.is_visible, italic = self.is_active or self.is_visible }
			end,
		},
		"",
		"",
		function(self)
			if self.is_active or self.is_visible then
				return colors.accent
			end

			return colors.inactiveBg
		end
	)

	local TablineTab = style.surround(
		{
			provider = function(self)
				return string.format(" %s ", self.tabnr)
			end,
			hl = { bold = true },
		},
		"",
		"",
		function(self)
			if self.is_active or self.is_visible then
				return colors.accent
			end

			return colors.inactiveBg
		end
	)

	--- @diagnostic disable-next-line
	local TabList = require("heirline.utils").make_tablist({ TablineTab })

	TabList.condition = function()
		return #vim.api.nvim_list_tabpages() > 1
	end

	--- @diagnostic disable-next-line
	local BufferList = require("heirline.utils").make_buflist({
		TablineFile,
		Divider,
	}, style.trunc(" "), style.trunc(" "))

	return {
		hl = { bg = colors.tablineBg },

		LeftDecorator,
		BufferList,
		{ provider = "%=" },
		TabList,
	}
end
