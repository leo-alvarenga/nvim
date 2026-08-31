return function()
	local utils = require("plugins.ui.heirline.shared.providers")
	local style = require("plugins.ui.heirline.shared.style")
	local colors = require("plugins.ui.heirline.shared.constants").colors

	-- Mode Chip (tmux session chip): flush mode block, closing wedge.
	-- Mirrors classic.conf status-left: "#S" on accent at the bar edge.
	local ViMode = style.surround(
		{
			provider = function()
				return string.format(" %s ", utils.vi_mode_provider())
			end,
			update = { "ModeChanged" },
		},
		"",
		"",
		utils.mode_color
	)

	local Git = style.surround({
		{
			provider = " ",
			hl = function()
				return { bg = colors.pillBg, fg = utils.mode_color() }
			end,
		},
		{
			provider = function()
				return utils.git_branch_provider() .. " "
			end,

			condition = utils.git_branch_condition,
		},
	}, "", "", colors.pillBg, colors.error, 0, 1)

	local Diagnostics = {
		utils.diag_component("Error", true),
		utils.diag_component("Warn", true),
		utils.diag_component("Info", true),
	}

	Diagnostics.condition = utils.diagnostics_condition
	Diagnostics.update = { "DiagnosticChanged", "BufEnter" }

	local FileName = {
		provider = function()
			return " " .. utils.file_name_provider() .. " "
		end,
		hl = { fg = colors.text },
	}

	local LspInfo = style.surround({
		{
			provider = utils.lsp_provider,
		},
		{
			provider = "",
			hl = { bg = colors.pillBg, fg = colors.accent },
		},
	}, "", "", colors.accent, colors.pillBg)

	LspInfo.update = { "LspAttach", "LspDetach" }

	-- FileInfo Component (filetype/copilot pill): pillBg shell with accent
	-- text, closing wedge into the accent position block (same colors as
	-- the other layouts).
	local FileInfo = style.surround({
		{
			provider = function()
				local ai = utils.ai_assist_state()
				local reg = utils.recording_label("  ")

				local filetype = utils.filetype_label()
				local ai_assist = ""
				if ai.copilot then
					ai_assist = "  "
				end
				if ai.supermaven then
					ai_assist = ai_assist .. "  "
				end

				return string.format(" %s%s %s%s", reg, utils.filetype_icon(0), filetype, ai_assist)
			end,
		},
		{
			provider = " ",
			hl = { bg = colors.pillBg, fg = colors.accent },
		},
	}, "", "", colors.pillBg, colors.accent)

	FileInfo.update = { "LspAttach", "LspDetach", "RecordingEnter", "RecordingLeave" }

	-- File Position Component (position pill): accent block with dark text,
	-- flush after FileInfo's closing wedge (accent, same as the other layouts).
	local FilePosition = style.surround({
		provider = function()
			return utils.file_position_provider("  ")
		end,
	}, "", "", colors.accent)

	return {
		hl = { bg = colors.statusBg },

		ViMode,
		Git,
		Diagnostics,
		FileName,

		{ provider = "%=" },

		LspInfo,
		FileInfo,
		FilePosition,
	}
end