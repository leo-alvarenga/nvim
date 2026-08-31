return function()
	local utils = require("plugins.ui.heirline.utils")
	local colors = utils.colors

	-- Mode Chip (tmux session chip): flush mode block, closing wedge.
	-- Mirrors classic.conf status-left: "#S" on accent at the bar edge.
	local ViMode = utils.surround(
		{
			provider = function()
				return string.format(" %s ", utils.vi_mode_provider())
			end,
			update = { "ModeChanged" },
		},
		"",
		"",
		function()
			local mode = vim.fn.mode():sub(1, 1)
			return utils.mode_colors[mode] or colors.info
		end
	)
	local Git = utils.surround({
		{
			provider = " ",
			hl = function()
				local mode = vim.fn.mode():sub(1, 1)
				return { bg = colors.pillBg, fg = utils.mode_colors[mode] or colors.info }
			end,
		},
		{
			provider = function()
				return utils.git_branch_provider() .. " "
			end,

			condition = utils.git_branch_condition,
		},
	}, "", "", colors.pillBg, colors.error, 0, 1)

	local DiagError = {
		condition = function()
			return utils.get_diag_count("Error") > 0
		end,
		provider = function()
			return string.format("  %s %s ", "", utils.get_diag_count("Error"))
		end,
		hl = { fg = colors.error },
	}

	local DiagWarn = {
		condition = function()
			return utils.get_diag_count("Warn") > 0
		end,
		provider = function()
			return string.format("  %s %s ", "", utils.get_diag_count("Warn"))
		end,
		hl = { fg = colors.warn },
	}

	local DiagInfo = {
		condition = function()
			return utils.get_diag_count("Info") > 0
		end,
		provider = function()
			return string.format("  %s %s ", "", utils.get_diag_count("Info"))
		end,
		hl = { fg = colors.info },
	}

	local Diagnostics = {
		DiagError,
		DiagWarn,
		DiagInfo,
	}

	Diagnostics.condition = function()
		return utils.get_diag_count("Error") > 0 or utils.get_diag_count("Warn") > 0 or utils.get_diag_count("Info") > 0
	end
	Diagnostics.update = { "DiagnosticChanged", "BufEnter" }
	local FileName = {
		provider = function()
			return " " .. utils.file_name_provider() .. " "
		end,
		hl = { fg = colors.text },
	}
	-- FileInfo Component (filetype/copilot pill): pillBg shell with accent
	-- text, closing wedge into the accent position block (same colors as
	-- the other layouts).
	local FileInfo = utils.surround({
		{
			provider = function()
				local filetype = vim.bo.filetype

				local ai = utils.ai_assist_state()

				if not filetype or filetype == "" then
					filetype = "no ft"
				end

				local reg = vim.fn.reg_recording() or ""

				local ai_assist = ""
				if ai.copilot then
					ai_assist = "  "
				end
				if ai.supermaven then
					ai_assist = ai_assist .. "  "
				end

				if reg ~= "" then
					reg = string.format("  %s  ", reg)
				end

				return string.format(" %s%s %s%s ", reg, utils.filetype_icon(0), filetype, ai_assist)
			end,
		},
		{
			provider = " ",
			hl = { bg = colors.pillBg, fg = colors.accent },
		},
	}, "", "", colors.pillBg, colors.accent)

	FileInfo.update = { "LspAttach", "LspDetach", "RecordingEnter", "RecordingLeave" }

	local LspInfo = utils.surround({
		{
			provider = function()
				local s = utils.lsp_status()
				local text = utils.lsp_icon(s.primary) .. " " .. s.primary
				if s.extra > 0 then
					text = text .. string.format(" (and %d more)", s.extra)
				end
				return " " .. text .. " "
			end,
		},
		{
			provider = " ",
			hl = { bg = colors.pillBg, fg = colors.accent },
		},
	}, "", "", colors.pillBg, colors.accent)

	LspInfo.condition = function()
		return utils.lsp_status() ~= nil
	end
	LspInfo.update = { "LspAttach", "LspDetach" }
	-- File Position Component (position pill): accent block with dark text,
	-- flush after FileInfo's closing wedge (accent, same as the other layouts).
	local FilePosition = utils.surround({
		provider = function()
			local encoding = vim.bo.fileencoding

			if not encoding or encoding == "" then
				encoding = "utf-8"
			end

			return string.format(
				" %s %s  %s:%s ",
				utils.file_formats[vim.bo.fileformat] or "",
				encoding,
				vim.fn.line("."),
				vim.fn.col(".")
			)
		end,
	}, "", "", colors.accent)
	return {
		hl = { bg = colors.statusBg },

		ViMode,
		Git,
		Diagnostics,
		FileName,

		{ provider = "%=" },

		FileInfo,
		LspInfo,
		FilePosition,
	}
end
