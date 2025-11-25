local M = {}

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
