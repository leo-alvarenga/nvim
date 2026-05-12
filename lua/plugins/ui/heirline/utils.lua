local utils = require("heirline.utils")

local M = {}

M.colors = require("values.constants.shared").colors

M.file_formats = {
	unix = "",
	dos = "󰨡",
	mac = "",
}

M.mode_colors = {
	n = M.colors.crystalBlue,
	i = M.colors.springGreen,
	v = M.colors.oniViolet,
	V = M.colors.oniViolet,
	["\22"] = M.colors.oniViolet,
	[""] = M.colors.oniViolet,
	c = M.colors.autumnRed,
	s = M.colors.boatYellow,
	S = M.colors.boatYellow,
	t = M.colors.autumnRed,
	unknown = M.colors.crystalBlue,
}

M.mode_icons = {
	n = "󰷊",
	i = "󱇧",
	v = "󰩬",
	V = "󰩬",
	["\22"] = "󰩬",
	[""] = "󰩬",
	c = "",
	s = "󰩬",
	S = "󰩬",
	unknown = "",
}

M.mode_names = {
	n = "NORMAL",
	i = "INSERT",
	v = "VISUAL",
	V = "V-LINE",
	["\22"] = "V-BLOCK",
	c = "COMMAND",
	s = "SELECT",
	S = "SELECT",
	t = "TERMINAL",
	["!"] = "SHELL",
	unknown = "UNKNOWN",
}

--- A helper function to create a "pill" component with the Kanagawa colorscheme style
--- @param color string|function The background color for the pill
--- @param component table The component to wrap in the pill
--- @param pl integer? Optional padding length (default: 0)
--- @param pr integer? Optional padding length (default: 0)
--- @return table The pill component
function M.to_kanagawa_pill(color, component, pl, pr)
	pl = pl or 0
	pr = pr or 0

	return utils.surround({ string.rep(" ", pl) .. "", "" .. string.rep(" ", pr) }, color, {
		hl = function(self)
			return {
				bold = true,
				fg = M.colors.sumiInk0,
				bg = type(color) == "string" and color or color(self),
			}
		end,
		component,
	})
end

--- A helper function to create a "pill" component with the Kanagawa colorscheme style
--- @param color string|function The background color for the pill
--- @param component table The component to wrap in the pill
--- @param pl integer? Optional padding length (default: 0)
--- @param pr integer? Optional padding length (default: 0)
--- @return table The pill component
function M.to_kanagawa_slanted(color, component, pl, pr)
	pl = pl or 0
	pr = pr or 0

	return {
		{
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
					fg = M.colors.sumiInk0,
				}
			end,
		},
		{
			provider = "" .. string.rep(" ", pr),
			hl = function(self)
				return {
					fg = type(color) == "string" and color or color(self),
				}
			end,
		},
	}
end

--- @param full_name string The full path of the file
--- @return string The icon for the file type
function M.filetype_icon(full_name)
	local filename = vim.fn.fnamemodify(full_name, ":t")
	local extension = vim.fn.fnamemodify(full_name, ":e")

	local icon, _ = require("nvim-web-devicons").get_icon(filename, extension, { default = true })

	return icon or ""
end

--- @param severity string
--- @return integer
function M.get_diag_count(severity)
	return #vim.diagnostic.get(0, { severity = vim.diagnostic.severity[severity:upper()] })
end

function M.get_lsp_count()
	local clients = vim.lsp.get_clients({ bufnr = 0 })

	local has_copilot = clients
		and vim.tbl_contains(
			vim.tbl_map(function(client)
				return client.name
			end, clients),
			"GitHub Copilot"
		)

	return #clients, has_copilot
end

return M
