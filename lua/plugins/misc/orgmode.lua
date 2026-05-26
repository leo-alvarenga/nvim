--- @type PluginSpec
return {
	name = "orgmode",
	src = "https://github.com/nvim-orgmode/orgmode",
	data = {
		config = function()
			require("orgmode").setup({
				org_agenda_files = {
					"~/.orgfiles/work.org",
					"~/.orgfiles/inbox.org",
					"~/.orgfiles/personal.org",
				},

				org_default_notes_file = "~/.orgfiles/inbox.org",

				org_todo_keywords = {
					"TODO",
					"IN-PROGRESS",
					"WAITING",
					"|",
					"DONE",
					"CANCELLED",
				},

				org_capture_templates = {
					t = {
						description = " Task or idea",
						template = "* %? \n %U",
						target = "~/.orgfiles/index.org",
					},

					-- Personal
					p = {
						description = "󰋜 Personal task",
						template = "* TODO (󰋜) %? :personal:\n %u",
						target = "~/.orgfiles/personal.org",
					},
					i = {
						description = " Inbox | Quick idea",
						template = "* %? \n %U",
						target = "~/.orgfiles/personal.org",
					},

					-- Work
					w = {
						description = "󱁤 Work task",
						template = "* TODO (󱁤) %? :work:\n %u",
						target = "~/.orgfiles/work.org",
					},
					m = {
						description = " Work meeting/Call",
						template = "* MEETING () %? :meeting:\n ** More info:\n",
						target = "~/.orgfiles/work.org",
					},
					s = {
						description = "󱞁 Meeting notes",
						template = "* NOTES (󱁤) %? :notes:\n Date: %U\n ** Notes\n - ",
						target = "~/.orgfiles/work.org",
					},
				},

				win_split_mode = "float",
				win_border = "rounded",
			})

			vim.lsp.enable("org")
		end,
	},
}
