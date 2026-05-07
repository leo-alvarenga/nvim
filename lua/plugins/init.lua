local M = {}

local map = require("config.utils.keymap").map

--- @param data PluginConfig
function M.exec_config_fn(data)
	if not data or not data.config then
		return
	end

	local config = function() end

	if type(data.config) == "function" then
		config = data.config
	elseif type(config) == "string" then
		config = function()
			vim.cmd(config)
		end
	end

	if data.events and type(data.events) == "table" then
		vim.api.nvim_create_autocmd(data.events, {
			callback = config,
		})

		return
	end

	config()
end

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

--- @param plugin PluginSpec
--- @return string src
function M.get_src(plugin)
	local src = string.gsub(plugin.src, "^gh:", "https://github.com/")
	return src or ""
end

--- @param verbose boolean?
function M.pack(verbose)
	--- @type string[]
	local plugin_names = {}

	--- @type PluginSpec[]
	local plugins = vim.tbl_map(function(plugin)
		plugin.src = M.get_src(plugin)

		table.insert(plugin_names, plugin.name or plugin.src)
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

	vim.api.nvim_create_user_command("PackListAll", function()
		vim.print("Installed plugins: \n" .. table.concat(plugin_names, ";\n"))
	end, { desc = "Load plugins" })
end

function M.get_installed_plugins()
	return vim.pack.get(nil, { info = false }) or {}
end

return M
