return function()
	local utils = require("plugins.ui.heirline.shared.providers")
	local style = require("plugins.ui.heirline.shared.style")
	local colors = require("plugins.ui.heirline.shared.constants").colors

	local ViMode = style.surround(
		{
			provider = utils.vi_mode_provider,

			hl = function()
				return {
					bg = utils.mode_color(),
					fg = colors.pillText,
					bold = true,
				}
			end,

			update = { "ModeChanged" },
		},
		nil,
		"",
		utils.mode_color
	)

	local Git = style.surround({
		{
			provider = " ",
			hl = function()
				return { bg = colors.pillBg, fg = utils.mode_color() }
			end,
		},
		{
			provider = utils.git_branch_provider,
		},
	}, "", nil, colors.pillBg, colors.error, 0, 1)

	local Diagnostics = style.pill(colors.pillBg, {
		utils.diag_component("Info"),

		{
			provider = " ",
			condition = function()
				return (utils.get_diag_count("Error") > 0 or utils.get_diag_count("Warn") > 0)
					and utils.get_diag_count("Info") > 0
			end,
		},

		utils.diag_component("Warn"),

		{
			provider = " ",
			condition = function()
				return utils.get_diag_count("Error") > 0 and utils.get_diag_count("Warn") > 0
			end,
		},

		utils.diag_component("Error"),
	}, 0, 1)

	Diagnostics.condition = utils.diagnostics_condition
	Diagnostics.update = { "DiagnosticChanged", "BufEnter" }

	local FileName = {
		hl = { fg = colors.text },
		provider = utils.file_name_provider,
	}

	local FileInfo = style.surround({
		{
			provider = function()
				local ai_icons = utils.ai_icons()
				local reg = utils.recording_label("| ")

				return string.format(" %s%s %s | %s ", reg, utils.filetype_icon(0), utils.filetype_label(), ai_icons)
			end,
		},
		{
			provider = "",
			hl = { bg = colors.pillBg, fg = colors.accent },
		},
	}, "", "", colors.pillBg, colors.accent)

	FileInfo.update = { "LspAttach", "LspDetach", "RecordingEnter", "RecordingLeave" }

	local LspInfo = style.pill(colors.accent, {
		{
			provider = utils.lsp_provider,
		},
		{
			provider = " ",
			hl = { bg = colors.accent, fg = colors.pillBg },
		},
	}, 0, 0, false, true)

	LspInfo.update = { "LspAttach", "LspDetach" }

	local FilePosition = style.surround({
		provider = function()
			return utils.file_position_provider(" | ")
		end,
	}, "", nil, colors.accent)

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