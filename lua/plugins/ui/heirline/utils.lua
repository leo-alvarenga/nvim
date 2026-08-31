local utils = require("heirline.utils")

local M = {}

M.colors = require("values.constants.shared").colors

M.file_formats = {
	unix = "",
	dos = "󰨡",
	mac = "",
}

M.mode_colors = {
	n = M.colors.info,
	i = M.colors.insert,
	v = M.colors.accent,
	V = M.colors.accent,
	["\22"] = M.colors.accent,
	[""] = M.colors.accent,
	c = M.colors.error,
	s = M.colors.warn,
	S = M.colors.warn,
	t = M.colors.error,
	unknown = M.colors.info,
}

M.mode_icons = {
	n = "󰷊",
	i = "󱇧",
	v = "󰩬",
	V = "󰩬",
	["\22"] = "󰩬",
	[""] = "󰩬",
	c = "",
	t = "",
	s = "󰩬",
	S = "󰩬",
	unknown = "",
	yazi = "󰙅",
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
	yazi = "Yazi",
}

function M.is_curr_buf_yazi()
	return vim.api.nvim_buf_get_name(0):sub(-4) == "yazi"
end

function M.is_curr_buf_dashboard()
	return vim.api.nvim_buf_get_name(0) == "homecoming://Dashboard"
end

function M.git_branch_condition()
	return not M.is_curr_buf_yazi() and not M.is_curr_buf_dashboard() and vim.b.gitsigns_head ~= nil
end

function M.git_branch_provider()
	local branch = vim.b.gitsigns_head or "no branch"
	local icon = "󰘬"

	if branch == "" or branch == "no branch" then
		icon = ""
		branch = "detached"
	end

	if vim.fn.strdisplaywidth(branch) > 20 then
		branch = vim.fn.strcharpart(branch, 0, 17) .. "..."
	end

	return string.format("%s %s", icon, branch)
end

--- @return string The current mode icon and name
function M.vi_mode_provider()
	local mode = vim.fn.mode():sub(1, 1)
	local icon = M.mode_icons[mode] or M.mode_icons.unknown
	local mode_name = M.mode_names[mode] or M.mode_names.unknown

	if M.is_curr_buf_yazi() then
		icon = M.mode_icons.yazi
		mode_name = M.mode_names.yazi
	end

	return icon .. " " .. mode_name
end

function M.file_name_provider()
	local status = ""

	if vim.bo.modified then
		status = " [+]"
	elseif vim.bo.readonly then
		status = " [-]"
	end

	return string.format("%s%s", vim.fn.expand("%:t"), status)
end

--- @param component table The component to wrap in the pill
--- @param left_sep string? The left separator for the pill (default: "")
--- @param right_sep string? The right separator for the pill (default: "
--- @param bg string|function The background color for the pill
--- @param fg string|function? The background color for the pill
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
				fg = fg or M.colors.pillText,
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
--- @return table The pill component
function M.pill(color, component, pl, pr)
	pl = pl or 0
	pr = pr or 0

	return utils.surround({ string.rep(" ", pl) .. "", "" .. string.rep(" ", pr) }, color, {
		hl = function(self)
			return {
				bold = true,
				fg = M.colors.pillText,
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
					fg = M.colors.pillText,
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


--- @param bufnr integer
--- @return string The icon for the file type
function M.filetype_icon(bufnr)
	local full_name = vim.api.nvim_buf_get_name(bufnr)

	local filename = vim.fn.fnamemodify(full_name, ":t")
	local extension = vim.fn.fnamemodify(full_name, ":e")

	local icon, _ = require("nvim-web-devicons").get_icon(filename, extension, { default = true })

	if not icon then
		icon, _ = require("nvim-web-devicons").get_icon(vim.bo[bufnr].filetype or "", nil, { default = true })
	end

	return icon or ""
end

--- @param severity string
--- @return integer
function M.get_diag_count(severity)
	return #vim.diagnostic.get(0, { severity = vim.diagnostic.severity[severity:upper()] })
end

function M.get_lsp_count()
	local clients = vim.lsp.get_clients({ bufnr = 0 })

	local has_copilot = false
	if clients then
		for _, client in ipairs(clients) do
			if client.name and string.match(client.name:lower(), "copilot") then
				has_copilot = true
				break
			end
		end
	end

	return #clients, has_copilot
end

local function copilot_enabled()
	return vim.g.loaded_copilot == 1 and vim.fn["copilot#Enabled"]() == 1
end

local function supermaven_active()
	if vim.g.SUPERMAVEN_DISABLED ~= nil then
		return vim.g.SUPERMAVEN_DISABLED == 0
	end

	local ok, api = pcall(require, "supermaven-nvim.api")
	return ok and type(api.is_completion_visible) == "function" and api.is_completion_visible()
end

--- @return table { copilot = boolean, supermaven = boolean }
function M.ai_assist_state()
	local _, lsp_copilot = M.get_lsp_count()

	return { copilot = copilot_enabled() or lsp_copilot, supermaven = supermaven_active() }
end

local ft_servers = {
	lua = "lua_ls",
	python = "pyright",
	["typescript"] = "tsserver",
	["javascript"] = "tsserver",
	rust = "rust-analyzer",
	go = "gopls",
	c = "clangd",
	cpp = "clangd",
	sh = "bashls",
	json = "jsonls",
	yaml = "yamlls",
	markdown = "marksman",
}

local lsp_icons = {
	lua_ls = "",
	tsserver = "",
	vtsls = "",
	pyright = "",
	["rust-analyzer"] = "",
	gopls = "",
	clangd = "",
	bashls = "",
	jsonls = "",
	yamlls = "",
	marksman = "",
}

--- @return table|nil { primary = string, extra = integer }
function M.lsp_status()
	local names = {}
	for _, client in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
		if client.name and client.name:lower() ~= "copilot" then
			table.insert(names, client.name)
		end
	end
	if #names == 0 then
		return nil
	end
	table.sort(names)

	local primary, preferred = names[1], ft_servers[vim.bo.filetype]
	for _, name in ipairs(names) do
		if name == preferred then
			primary = name
			break
		end
	end

	return { primary = primary, extra = #names - 1 }
end

function M.lsp_icon(name)
	return lsp_icons[name] or ""
end

return M
