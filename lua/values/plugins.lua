local M = {}

M.plugins = {
	copilot = true,
	codecompanion = true,
	sidekick = false,
	supermaven = false,
}

--- Check if a plugin is enabled
--- @param plugin string The name of the plugin to check
function M.is_enabled(plugin)
	if type(plugin) ~= "string" then
		return false
	end

	return M.plugins[plugin] == true
end

return M
