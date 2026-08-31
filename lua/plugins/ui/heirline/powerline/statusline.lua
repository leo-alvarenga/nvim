return function()
	local utils = require("plugins.ui.heirline.utils")

	local ViMode = utils.surround(
		{
			provider = function()
				local mode = utils.vi_mode_provider()
				return string.format(" %s ", mode)
			end,

			hl = function()
				local mode = vim.fn.mode():sub(1, 1)
				return {
					bg = utils.mode_colors[mode] or utils.colors.info,
					fg = utils.colors.pillText,
					bold = true,
				}
			end,

			update = { "ModeChanged" },
		},
		"",
		"",
		function()
			local mode = vim.fn.mode():sub(1, 1)
			return utils.mode_colors[mode] or utils.colors.info
		end
	)
	local Git = utils.surround({
		{
			provider = " ",
			hl = function()
				local mode = vim.fn.mode():sub(1, 1)
				return { bg = utils.colors.pillBg, fg = utils.mode_colors[mode] or utils.colors.info }
			end,
		},
		{
			condition = utils.git_branch_condition,
			provider = function()
				local git = utils.git_branch_provider()

				return string.format("%s ", git)
			end,
		},
	}, "", "", utils.colors.pillBg, utils.colors.error, 0, 1)

	local DiagError = {
		condition = function()
			return utils.get_diag_count("Error") > 0
		end,
		provider = function()
			return " " .. utils.get_diag_count("Error")
		end,
		hl = { fg = utils.colors.error },
	}

	local DiagWarn = {
		condition = function()
			return utils.get_diag_count("Warn") > 0
		end,
		provider = function()
			return " " .. utils.get_diag_count("Warn")
		end,
		hl = { fg = utils.colors.warn },
	}

	local DiagInfo = {
		condition = function()
			return utils.get_diag_count("Info") > 0
		end,
		provider = function()
			return " " .. utils.get_diag_count("Info")
		end,
		hl = { fg = utils.colors.info },
	}

	local Diagnostics = utils.slanted(utils.colors.pillBg, {
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
	local FileName = {
		hl = { fg = utils.colors.text },
		provider = utils.file_name_provider,
	}
	local FileInfo = utils.surround({
		{
			provider = function()
				local filetype = vim.bo.filetype

				local _, has_copilot = utils.get_lsp_count()

				if not filetype or filetype == "" then
					filetype = "no ft"
				end

				local copilot = has_copilot and "" or ""
				local reg = vim.fn.reg_recording() or ""

				if reg ~= "" then
					reg = string.format("  %s  ", reg)
				end

				return string.format(" %s%s %s  %s ", reg, utils.filetype_icon(0), filetype, copilot)
			end,
		},
		{
			provider = " ",
			hl = { bg = utils.colors.pillBg, fg = utils.colors.accent },
		},
	}, "", "", utils.colors.pillBg, utils.colors.accent)

	FileInfo.update = { "LspAttach", "LspDetach", "RecordingEnter", "RecordingLeave" }
	local FilePosition = utils.surround({
		provider = function()
			local encoding = vim.bo.fileencoding

			if not encoding or encoding == "" then
				encoding = "utf-8"
			end

			return string.format(
				" %s %s  %s:%s ",
				utils.file_formats[vim.bo.fileformat] or "",
				encoding,
				vim.fn.line("."),
				vim.fn.col(".")
			)
		end,
	}, "", "", utils.colors.accent)
	return {
		hl = { bg = utils.colors.statusBg },

		ViMode,
		Git,
		Diagnostics,
		FileName,

		{ provider = "%=" },

		FileInfo,
		FilePosition,
	}
end
