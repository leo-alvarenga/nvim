local _lazy = require("utils.lazy")
local _shared = require("utils.constants.shared")
local _table = require("utils.table")

---Normalize as an actual prompt command
---@param cmd string
local function to_action(cmd)
	if not cmd or type(cmd) ~= "string" then
		return ""
	end

	return ":" .. cmd
end

---Given an option table, merge it and ensure it is a valid center option for dashboard-nvim
---@param opt table
local function to_option(opt)
	local default_values = {
		icon = "?  ",
		icon_hl = "group",
		desc = "Empty option",
		key = "?",
		key_hl = "group",
		key_format = "SPC %s",
		action = to_action('lua vim.notify("Empty option... Doing nothing")'),
	}

	if not opt or type(opt) ~= "table" then
		return default_values
	end

	return _table.merge({ default_values, opt })
end

local M = {}

M.theme = "doom"

M.banner = {
	" ",
	" ",
	" ",
	" ",
	" ",
	"                                                                   ",
	" ███▄▄▄▄      ▄████████  ▄██████▄   ▄█    █▄   ▄█    ▄▄▄▄███▄▄▄▄   ",
	" ███▀▀▀██▄   ███    ███ ███    ███ ███    ███ ███  ▄██▀▀▀███▀▀▀██▄ ",
	" ███   ███   ███    █▀  ███    ███ ███    ███ ███▌ ███   ███   ███ ",
	" ███   ███  ▄███▄▄▄     ███    ███ ███    ███ ███▌ ███   ███   ███ ",
	" ███   ███ ▀▀███▀▀▀     ███    ███ ███    ███ ███▌ ███   ███   ███ ",
	" ███   ███   ███    █▄  ███    ███ ███    ███ ███  ███   ███   ███ ",
	" ███   ███   ███    ███ ███    ███ ███    ███ ███  ███   ███   ███ ",
	"  ▀█   █▀    ██████████  ▀██████▀   ▀██████▀  █▀    ▀█   ███   █▀  ",
	"                                                                   ",
	" ",
}

M.header = {}

function M.update_header()
	local quote = require("quoth-nvim").get_random_quote()

	M.header = _table.merge_arrays({
		M.icon or {},
		M.banner,
		{
			quote.text,
			"",
			quote.author,
		},
		{
			" ",
			" ",
			" ",
		},
	})
end

M.footer = {
	" " .. _lazy.get_pkg_count() .. " plugins installed with Lazy.nvim",
}

M.actions = {}

M.actions.options = {
	{
		icon = "  ",
		desc = "Select a known workspace",
		key = "w",
		action = to_action(_shared.telescope.workspaces.cmd),
	},
	{
		icon = "  ",
		desc = "Explore current directory",
		key = "e",
		action = to_action(_shared.oil.cmd),
	},
	{
		icon = "  ",
		desc = "Open file from current directory",
		key = "f",
		action = to_action(_shared.telescope.find_files.cmd),
	},
}

M.actions.option_list = vim.iter(M.actions.options)
	:map(function(opt)
		return to_option(opt)
	end)
	:totable()

return M
