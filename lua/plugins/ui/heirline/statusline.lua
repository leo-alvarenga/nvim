return function()
	local conditions = require("heirline.conditions")

	local utils = require("plugins.ui.heirline.utils")

	----------------------------------------------------------------
	-- COMPONENTS
	----------------------------------------------------------------

	-----------------------------------
	-- Mode Component
	local ViMode = utils.to_kanagawa_pill(function()
		local mode = vim.fn.mode():sub(1, 1)
		return utils.mode_colors[mode] or utils.colors.crystalBlue
	end, {
		provider = function()
			local mode = vim.fn.mode():sub(1, 1)
			return utils.mode_icons[mode] .. " " .. utils.mode_names[mode]
		end,

		hl = function()
			local mode = vim.fn.mode():sub(1, 1)
			return {
				bg = utils.mode_colors[mode] or utils.colors.crystalBlue,
				fg = utils.colors.sumiInk0,
				bold = true,
			}
		end,

		update = { "ModeChanged" },
	}, 0, 1)
	-----------------------------------

	-----------------------------------
	-- Git Branch Component
	local Git = utils.to_kanagawa_pill(utils.colors.autumnRed, {
		provider = function()
			local branch = vim.fn.system("git branch --show-current"):gsub("\n", "")

			if vim.fn.strdisplaywidth(branch) > 20 then
				branch = vim.fn.strcharpart(branch, 0, 17) .. "..."
			end

			return string.format("󰘬 %s", branch)
		end,
	}, 0, 1)

	Git.condition = conditions.is_git_repo
	-----------------------------------

	-----------------------------------
	-- Diagnostics Component
	-- Individual Diagnostic Levels
	local DiagError = {
		condition = function()
			return utils.get_diag_count("Error") > 0
		end,
		provider = function()
			return " " .. utils.get_diag_count("Error")
		end,
		hl = { fg = utils.colors.autumnRed },
	}

	local DiagWarn = {
		condition = function()
			return utils.get_diag_count("Warn") > 0
		end,
		provider = function()
			return " " .. utils.get_diag_count("Warn")
		end,
		hl = { fg = utils.colors.boatYellow },
	}

	local DiagInfo = {
		condition = function()
			return utils.get_diag_count("Info") > 0
		end,
		provider = function()
			return " " .. utils.get_diag_count("Info")
		end,
		hl = { fg = utils.colors.crystalBlue },
	}

	local Diagnostics = utils.to_kanagawa_pill(utils.colors.sumiInk1, {
		DiagInfo,

		{
			provider = " ",
			condition = function()
				return (utils.get_diag_count("Error") > 0 or utils.get_diag_count("Warn") > 0)
					and utils.get_diag_count("Info") > 0
			end,
		},

		DiagWarn,

		{
			provider = " ",
			condition = function()
				return utils.get_diag_count("Error") > 0 and utils.get_diag_count("Warn") > 0
			end,
		},

		DiagError,
	}, 0, 1)

	Diagnostics.condition = function()
		return utils.get_diag_count("Error") > 0 or utils.get_diag_count("Warn") > 0 or utils.get_diag_count("Info") > 0
	end
	Diagnostics.update = { "DiagnosticChanged", "BufEnter" }
	-----------------------------------

	-----------------------------------
	-- File name Component
	local FileName = {
		hl = { fg = utils.colors.fujiWhite },
		provider = function()
			local status = ""

			if vim.bo.modified then
				status = " [+]"
			elseif vim.bo.readonly then
				status = " [-]"
			end

			return string.format("%s%s", vim.fn.expand("%:t"), status)
		end,
	}
	-----------------------------------

	-----------------------------------
	-- FileInfo Component
	local FileInfo = utils.to_kanagawa_pill(utils.colors.oniViolet, {
		provider = function()
			local filetype = vim.bo.filetype

			local lsp_count, has_copilot = utils.get_lsp_count()

			if not filetype or filetype == "" then
				filetype = "no ft"
			end

			local lsp_indicator = lsp_count > 0 and "" or ""
			local copilot = {
				icon = has_copilot and "" or "",
				status = has_copilot and "Ready" or "Offline",
			}

			return string.format(
				"%s %s | %s %d | %s %s",
				utils.filetype_icon(vim.api.nvim_buf_get_name(0)),
				filetype,
				lsp_indicator,
				lsp_count,
				copilot.icon,
				copilot.status
			)
		end,
	}, 0, 1)

	FileInfo.condition = conditions.lsp_attached
	FileInfo.update = { "LspAttach", "LspDetach" }
	-----------------------------------

	-----------------------------------
	-- File Position Component
	local FilePosition = utils.to_kanagawa_pill(utils.colors.springGreen, {
		provider = function()
			local encoding = vim.bo.fileencoding

			if not encoding or encoding == "" then
				encoding = "utf-8"
			end

			return string.format(
				"%s %s | %s:%s",
				utils.file_formats[vim.bo.fileformat] or "",
				encoding,
				vim.fn.line("."),
				vim.fn.col(".")
			)
		end,
	})
	-----------------------------------

	return {
		hl = { bg = "NONE" },

		ViMode,
		Git,
		Diagnostics,
		FileName,

		{ provider = "%=" },

		FileInfo,
		FilePosition,
	}
end
