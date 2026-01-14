local M = {}

--- Add prefix to keymap based on the action target
---@param keymap string
---@param target string?
function M.with_prefix(keymap, target)
	local prefix_table = require("utils.constants.prefix")
	local prefix = prefix_table[target] or prefix_table.general

	return prefix .. keymap
end

--- From a nil or string value, get a valid options object to use when mapping
function M.to_options(desc)
	local options = { noremap = true, silent = true }

	if desc then
		options.desc = desc
	end

	return options
end

--- Wrapper for setting keymaps via the vim.keymap api
function M.map(mode, key, command, desc)
	vim.keymap.set(mode, key, command, M.to_options(desc))
end

---Convert raw string to Vim CMD
---@param cmd string
function M.to_cmd(cmd)
	if not cmd or type(cmd) ~= "string" then
		return ""
	end

	return ":" .. cmd .. "<CR>"
end

return M
