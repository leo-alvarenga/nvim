local M = {}

--- Add prefix to keymap based on the action target
--- @param keymap string Keymap to add prefix to
--- @param target string? Target action (e.g., "buffers", "tabs", etc.); Defaults to "general"
--- @return string Keymap with prefix added
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
--- @param mode string|string[] Mode to set the keymap in
--- @param key string The key combination to map
--- @param command string|function The command or function to execute
--- @param desc string|nil Description for the keymap
function M.map(mode, key, command, desc)
	vim.keymap.set(mode, key, command, M.to_options(desc))
end

---Convert raw string to Vim CMD
--- @param cmd string
--- @param plugin string? Optional plugin name for context
--- @param terminator string? Optional terminator to append to the command (Defaults to "<CR>")
function M.to_cmd(cmd, plugin, terminator)
	if not cmd or type(cmd) ~= "string" then
		return ""
	end

	if type(plugin) == "string" and not require("utils.config"):is_enabled("plugins", plugin) then
		return ""
	end

	terminator = terminator or "<CR>"

	return ":" .. cmd .. terminator
end

return M
