return function()
	local utils = require("plugins.ui.heirline.utils")

	--- @param provider function|string
	local get_trunc = function(provider)
		return {
			provider = provider,
			hl = { fg = utils.colors.accent },
		}
	end

	local Divider = { provider = " " }

	-- LeftDecorator (tmux session chip): flush accent block, closing wedge.
	local LeftDecorator = utils.surround({ provider = "  " }, "", "", utils.colors.accent)

	-- Buffer/File entry: accent block when active, muted block otherwise.
	-- Mirrors classic.conf window-status-current-format / window-status-format:
	-- dark notch, " icon  (U+E0B1)  name " content, closing wedge.
	-- The modified dot  is the analog of the tmux zoomed flag: active only.
	local TablineFile = utils.surround(
		{
			provider = function(self)
				local icon = utils.filetype_icon(self.bufnr)

				local filename = vim.api.nvim_buf_get_name(self.bufnr)
				filename = filename == "" and "[No Name]" or vim.fn.fnamemodify(filename, ":t")

				local modified = ""
				if self.is_active and vim.fn.getbufinfo(self.bufnr)[1].changed == 1 then
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
				return utils.colors.accent
			end

			return utils.colors.inactiveBg
		end
	)
	local TablineTab = utils.surround(
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
				return utils.colors.accent
			end

			return utils.colors.inactiveBg
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
	}, get_trunc(" "), get_trunc(" "))

	return {
		hl = { bg = utils.colors.tablineBg },

		LeftDecorator,
		BufferList,
		{ provider = "%=" },
		TabList,
	}
end
