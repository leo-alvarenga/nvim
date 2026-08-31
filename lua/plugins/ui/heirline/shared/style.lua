local utils = require("heirline.utils")
local c = require("plugins.ui.heirline.shared.constants")

local M = {}

--- @param component table The component to wrap in the pill
--- @param left_sep string? The left separator for the pill (default: "")
--- @param right_sep string? The right separator for the pill (default: "")
--- @param bg string|function The background color for the pill
--- @param fg string|function? The foreground color for the pill
--- @param pl integer? Optional padding length (default: 0)
--- @param pr integer? Optional padding length (default: 0)
--- @return table The pill component
function M.surround(component, left_sep, right_sep, bg, fg, pl, pr)
	left_sep = left_sep or ""
	right_sep = right_sep or ""

	pl = pl or 0
	pr = pr or 0

	return utils.surround({ string.rep(" ", pl) .. left_sep, right_sep .. string.rep(" ", pr) }, bg, {
		hl = function(self)
			return {
				bold = true,
				fg = fg or c.colors.pillText,
				bg = type(bg) == "string" and bg or bg(self),
			}
		end,
		component,
	})
end

--- A helper function to create a "pill" component with rounded separators
--- @param color string|function The background color for the pill
--- @param component table The component to wrap in the pill
--- @param pl integer? Optional padding length (default: 0)
--- @param pr integer? Optional padding length (default: 0)
--- @param disable_l boolean? Optional flag to disable the left separator (default: false)
--- @param disable_r boolean? Optional flag to disable the right separator (default: false)
--- @return table The pill component
function M.pill(color, component, pl, pr, disable_l, disable_r)
	pl = pl or 0
	pr = pr or 0

	local left_sep = disable_l and "" or ""
	local right_sep = disable_r and "" or ""

	return utils.surround({ string.rep(" ", pl) .. left_sep, right_sep .. string.rep(" ", pr) }, color, {
		hl = function(self)
			return {
				bold = true,
				fg = c.colors.pillText,
				bg = type(color) == "string" and color or color(self),
			}
		end,
		component,
	})
end

--- A helper function to create a "slanted" (powerline) component
--- @param color string|function The background color for the slanted piece
--- @param component table The component to wrap in the slanted piece
--- @param pl integer? Optional padding length (default: 0)
--- @param pr integer? Optional padding length (default: 0)
--- @param disable_l boolean? Optional flag to disable the left separator (default: false)
--- @param disable_r boolean? Optional flag to disable the right separator (default: false)
--- @return table The slanted component
function M.slanted(color, component, pl, pr, disable_l, disable_r)
	pl = pl or 0
	pr = pr or 0

	return {
		{
			condition = function()
				return not disable_l
			end,
			provider = string.rep(" ", pl) .. "",
			hl = function(self)
				return {
					fg = type(color) == "string" and color or color(self),
				}
			end,
		},
		{
			type(component) == "table" and utils.insert(component) or component,
			hl = function(self)
				return {
					bg = type(color) == "string" and color or color(self),
					fg = c.colors.pillText,
				}
			end,
		},
		{
			condition = function()
				return not disable_r
			end,
			provider = "" .. string.rep(" ", pr),
			hl = function(self)
				return {
					fg = type(color) == "string" and color or color(self),
				}
			end,
		},
	}
end

--- @param provider function|string
--- @return table A truncated element with accent fg
function M.trunc(provider)
	return {
		provider = provider,
		hl = { fg = c.colors.accent },
	}
end

return M