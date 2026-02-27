local _ui = require("values.ui")
local _shared = require("values.constants.shared")

local sections = {
	files = "  Files",
	config = "  Config",
	plugins = " Plugins and LSPs",
	exit = "  Exit",
}

return {
	"leo-alvarenga/homecoming.nvim",
	dir = "~/personal/homecoming.nvim",

	opts = {
		enabled = true,
		section_anchor = "header_half",
		sections = {
			{
				title = sections.files,
				items = {

					{
						action = _shared.cmds.oil,
						label = _shared.descriptions.oil.browse,
					},
					{
						action = _shared.cmds.neo_tree,
						label = _shared.descriptions.neo_tree.tree,
						section = sections.files,
					},
					{
						action = _shared.cmds.telescope.find_files,
						label = _shared.descriptions.telescope.find_files,
						section = sections.files,
					},
					{
						action = _shared.cmds.telescope.live_grep,
						label = _shared.descriptions.telescope.live_grep,
						section = sections.files,
					},
				},
			},
			{
				title = sections.config,
				items = {
					{
						action = _shared.cmds.edit_config,
						label = _shared.descriptions.edit_config,
					},
				},
			},
			{
				title = sections.plugins,
				items = {
					{ action = _shared.cmds.lazy, label = _shared.descriptions.lazy },
					{
						action = _shared.cmds.mason.manager,
						label = _shared.descriptions.mason.manager,
						section = sections.plugins,
					},
				},
			},
			{
				title = sections.exit,
				items = {
					{ action = _shared.cmds.quit, label = _shared.descriptions.quit },
				},
			},
		},
		header = _ui.banner,

		footer_mt = 2,
		footer = function()
			local quote = require("quoth-nvim").get_random_quote()
			return { '"' .. quote.text .. '"', quote.author }
		end,
	},
}
