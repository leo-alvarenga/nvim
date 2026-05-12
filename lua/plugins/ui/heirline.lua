--- @type PluginSpec
return {
	name = "heirline",
	src = "gh:rebelot/heirline.nvim",
	data = {
		config = function()
			-----------------------------------
			-- Imports and Colors
			local conditions = require("heirline.conditions")
			local utils = require("heirline.utils")

			-- TODO: add more colors from the Kanagawa palette, preferably consuming from the colorscheme itself instead of hardcoding
			local colors = {
				sumiInk0 = "#16161D",
				crystalBlue = "#7E9CD8",
				springGreen = "#76946A",
				oniViolet = "#957FB8",
				fujiWhite = "#DCD7BA",
				autumnRed = "#E46876",
				boatYellow = "#C0A36E",
				sumiInk1 = "#21222C",
				sumiInk2 = "#403B4A",
			}

			local mode_colors = {
				n = colors.crystalBlue,
				i = colors.springGreen,
				v = colors.oniViolet,
				V = colors.oniViolet,
				["\22"] = colors.oniViolet,
				[""] = colors.oniViolet,
				c = colors.autumnRed,
				s = colors.boatYellow,
				S = colors.boatYellow,
				t = colors.autumnRed,
				unknown = colors.crystalBlue,
			}

			local mode_icons = {
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

			local mode_names = {
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

			local file_formats = {
				unix = "",
				dos = "󰨡",
				mac = "",
			}

			-----------------------------------

			-----------------------------------
			-- Helpers

			--- A helper function to create a "pill" component with the Kanagawa colorscheme style
			--- @param color string|function The background color for the pill
			--- @param component table The component to wrap in the pill
			--- @param pl integer? Optional padding length (default: 0)
			--- @param pr integer? Optional padding length (default: 0)
			--- @return table The pill component
			local function to_kanagawa_pill(color, component, pl, pr)
				pl = pl or 0
				pr = pr or 0

				return utils.surround({ string.rep(" ", pl) .. "", "" .. string.rep(" ", pr) }, color, {
					hl = { fg = colors.sumiInk0, bg = color, bold = true },
					component,
				})
			end

			local function filetype_icon()
				local full_name = vim.api.nvim_buf_get_name(0)
				local filename = vim.fn.fnamemodify(full_name, ":t")
				local extension = vim.fn.fnamemodify(full_name, ":e")

				local icon, _ = require("nvim-web-devicons").get_icon(filename, extension, { default = true })

				return icon or ""
			end

			--- @param severity string
			--- @return integer
			local function get_diag_count(severity)
				-- severity can be "Error", "Warn", "Info", or "Hint"
				return #vim.diagnostic.get(0, { severity = vim.diagnostic.severity[severity:upper()] })
			end

			local function get_lsp_count()
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

			-----------------------------------

			----------------------------------------------------------------
			-- COMPONENTS
			----------------------------------------------------------------

			-----------------------------------
			-- Mode Component
			local ViMode = to_kanagawa_pill(
				function() -- This function determines the color of the "surround" (the tips)
					local mode = vim.fn.mode():sub(1, 1)
					return mode_colors[mode] or colors.crystalBlue
				end,
				{
					provider = function()
						local mode = vim.fn.mode():sub(1, 1)
						return mode_icons[mode] .. " " .. mode_names[mode]
					end,

					hl = function()
						local mode = vim.fn.mode():sub(1, 1) -- Get the first char of mode
						return {
							bg = mode_colors[mode] or colors.crystalBlue,
							fg = colors.sumiInk0,
							bold = true,
						}
					end,

					update = { "ModeChanged" },
				},
				0,
				1
			)
			-----------------------------------

			-----------------------------------
			-- Git Branch Component
			local Git = to_kanagawa_pill(colors.autumnRed, {
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
					return get_diag_count("Error") > 0
				end,
				provider = function()
					return " " .. get_diag_count("Error")
				end,
				hl = { fg = colors.autumnRed },
			}

			local DiagWarn = {
				condition = function()
					return get_diag_count("Warn") > 0
				end,
				provider = function()
					return " " .. get_diag_count("Warn")
				end,
				hl = { fg = colors.boatYellow },
			}

			local DiagInfo = {
				condition = function()
					return get_diag_count("Info") > 0
				end,
				provider = function()
					return " " .. get_diag_count("Info")
				end,
				hl = { fg = colors.crystalBlue },
			}

			local Diagnostics = to_kanagawa_pill(colors.sumiInk1, {
				DiagInfo,

				{
					provider = " ",
					condition = function()
						return (get_diag_count("Error") > 0 or get_diag_count("Warn") > 0)
							and get_diag_count("Info") > 0
					end,
				},

				DiagWarn,

				{
					provider = " ",
					condition = function()
						return get_diag_count("Error") > 0 and get_diag_count("Warn") > 0
					end,
				},

				DiagError,
			}, 0, 1)

			Diagnostics.condition = function()
				return get_diag_count("Error") > 0 or get_diag_count("Warn") > 0 or get_diag_count("Info") > 0
			end
			Diagnostics.update = { "DiagnosticChanged", "BufEnter" }
			-----------------------------------

			-----------------------------------
			-- File name Component
			local FileName = {
				hl = { fg = colors.fujiWhite },
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
			local FileInfo = to_kanagawa_pill(colors.oniViolet, {
				provider = function()
					local filetype = vim.bo.filetype

					local lsp_count, has_copilot = get_lsp_count()

					if not filetype or filetype == "" then
						filetype = "no ft"
					end

					local lsp_indicator = lsp_count > 0 and "" or ""
					local copilot_indicator = has_copilot and "  Ready" or "  Offline"

					return string.format(
						"%s %s %s %d | %s",
						filetype_icon(),
						filetype,
						lsp_indicator,
						lsp_count,
						copilot_indicator
					)
				end,
			}, 0, 1)

			FileInfo.condition = conditions.lsp_attached
			FileInfo.update = { "LspAttach", "LspDetach" }
			-----------------------------------

			-----------------------------------
			-- File Position Component
			local FilePosition = to_kanagawa_pill(colors.springGreen, {
				provider = function()
					local encoding = vim.bo.fileencoding

					if not encoding or encoding == "" then
						encoding = "utf-8"
					end

					return string.format(
						"%s %s | %s:%s",
						file_formats[vim.bo.fileformat] or "",
						encoding,
						vim.fn.line("."),
						vim.fn.col(".")
					)
				end,
			})
			-----------------------------------
			---
			local StatusLine = {
				hl = { bg = "NONE" }, -- Transparent background like your Tmux config

				ViMode,
				Git,
				Diagnostics,
				FileName,
				{ provider = "%=" },

				FileInfo,
				FilePosition,
			}

			require("heirline").setup({ statusline = StatusLine })
		end,
	},
}
