local c = require("plugins.ui.heirline.shared.constants")

local M = {}

--- Buffer state --------------------------------------------------------------

function M.is_curr_buf_yazi()
	return vim.api.nvim_buf_get_name(0):sub(-4) == "yazi"
end

function M.is_curr_buf_dashboard()
	return vim.api.nvim_buf_get_name(0) == "homecoming://Dashboard"
end

--- @return string The mode color of the current mode
function M.mode_color()
	return c.mode_colors[vim.fn.mode():sub(1, 1)] or c.colors.info
end

--- Git -----------------------------------------------------------------------

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

--- Mode ----------------------------------------------------------------------

--- @return string The current mode icon and name
function M.vi_mode_provider()
	local mode = vim.fn.mode():sub(1, 1)
	local icon = c.mode_icons[mode] or c.mode_icons.unknown
	local mode_name = c.mode_names[mode] or c.mode_names.unknown

	if M.is_curr_buf_yazi() then
		icon = c.mode_icons.yazi
		mode_name = c.mode_names.yazi
	end

	return icon .. " " .. mode_name
end

--- File ----------------------------------------------------------------------

function M.file_name_provider()
	local status = ""

	if vim.bo.modified then
		status = " [+]"
	elseif vim.bo.readonly then
		status = " [-]"
	end

	return string.format("%s%s", vim.fn.expand("%:t"), status)
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

--- @return string The filetype label, falling back to "no ft"
function M.filetype_label()
	local filetype = vim.bo.filetype

	if not filetype or filetype == "" then
		filetype = "no ft"
	end

	return filetype
end

--- @param bufnr integer
--- @return string icon, string filename The buffer icon and basename
function M.buffer_label(bufnr)
	local icon = M.filetype_icon(bufnr)

	local filename = vim.api.nvim_buf_get_name(bufnr)
	filename = filename == "" and "[No Name]" or vim.fn.fnamemodify(filename, ":t")

	return icon, filename
end

--- @param bufnr integer
--- @return boolean Whether the buffer has unsaved changes
function M.buffer_modified(bufnr)
	return vim.fn.getbufinfo(bufnr)[1].changed == 1
end

--- Diagnostics ---------------------------------------------------------------

--- @param severity string
--- @return integer
function M.get_diag_count(severity)
	return #vim.diagnostic.get(0, { severity = vim.diagnostic.severity[severity:upper()] })
end

local diag_icons = { Error = "", Warn = "", Info = "" }

--- A bare diagnostic component: condition + provider + hl.
--- @param severity string "Error" | "Warn" | "Info"
--- @param padded boolean? Classic layout pads the label (default: false)
function M.diag_component(severity, padded)
	local icon = diag_icons[severity]
	local provider = padded
			and function()
				return string.format("  %s %s ", icon, M.get_diag_count(severity))
			end
		or function()
			return icon .. " " .. M.get_diag_count(severity)
		end

	return {
		condition = function()
			return M.get_diag_count(severity) > 0
		end,
		provider = provider,
		hl = { fg = c.colors[severity:lower()] },
	}
end

function M.diagnostics_condition()
	return M.get_diag_count("Error") > 0 or M.get_diag_count("Warn") > 0 or M.get_diag_count("Info") > 0
end

--- LSP + AI ------------------------------------------------------------------

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

	local primary, preferred = names[1], c.ft_servers[vim.bo.filetype]
	for _, name in ipairs(names) do
		if name == preferred then
			primary = name
			break
		end
	end

	return { primary = primary, extra = #names - 1 }
end

function M.lsp_icon(name)
	return c.lsp_icons[name] or ""
end

function M.lsp_provider()
	local s = M.lsp_status()

	if not s then
		return " " .. M.lsp_icon("NO_LSP") .. " "
	end

	local text = M.lsp_icon(s.primary) .. " " .. s.primary
	if s.extra > 0 then
		text = text .. string.format(" (+%d)", s.extra)
	end

	return " " .. text .. " "
end

--- Composed providers --------------------------------------------------------

--- @param sep string The separator glyph between the macro and the filetype
--- @return string The macro recording label, empty when not recording
function M.recording_label(sep)
	local reg = vim.fn.reg_recording() or ""

	if reg ~= "" then
		reg = string.format("  %s %s", reg, sep)
	end

	return reg
end

--- @return string Copilot/supermaven icons, fallback icon when neither is active
function M.ai_icons()
	local ai = M.ai_assist_state()

	local icons = (ai.copilot and " " or "") .. (ai.supermaven and " " or "")
	if icons == "" then
		icons = ""
	end

	return icons
end

--- @param sep string The separator glyph between format/encoding and line:col
--- @return string " fmt enc<sep>line:col "
function M.file_position_provider(sep)
	local encoding = vim.bo.fileencoding

	if not encoding or encoding == "" then
		encoding = "utf-8"
	end

	return string.format(
		" %s %s%s%s:%s ",
		c.file_formats[vim.bo.fileformat] or "",
		encoding,
		sep,
		vim.fn.line("."),
		vim.fn.col(".")
	)
end

return M