local M = {}

local map = require("config.utils.keymap").map

--- @param plugin PluginSpec
function M.setup_plugin(plugin)
	if not plugin or not plugin.data then
		return
	end

	if type(plugin.data.config) == "function" then
		plugin.data.config()
	elseif type(plugin.data.config) == "string" then
		vim.cmd(plugin.data.config)
	end

	if plugin.data.keys and type(plugin.data.keys) == "table" then
		for _, keymap in ipairs(plugin.data.keys) do
			map(keymap.mode, keymap.key, keymap.command, keymap.desc, keymap.opts)
		end
	end
end

--- @param verbose boolean?
function M.pack(verbose)
	--- @type PluginSpec[]
	local plugins = vim.tbl_map(function(plugin)
		local src = plugin.src

		if type(src) == "string" then
			plugin.src = string.gsub(plugin.src, "^gh:", "https://github.com/")
		end

		return plugin
	end, require("plugins.helpers").get_plugins())

	vim.pack.add(plugins)

	for _, plugin in ipairs(plugins) do
		::continue::

		if not plugin then
			goto continue
		end

		if verbose then
			vim.print("Setting up plugin: " .. (plugin.name or plugin.src))
		end

		M.setup_plugin(plugin)
	end
end

function M.get_installed_plugins()
	return vim.pack.get(nil, { info = false }) or {}
end

return M
