local defaults_file_dir = vim.fn.stdpath("config") .. "/defaults.json"
local example_file_dir = vim.fn.stdpath("config") .. "/values_example.json"
local values_file_dir = vim.fn.stdpath("config") .. "/values.json"

Config = { values = {} }

function Config:read_or_create_values(child_call)
	local json = require("utils.json")
	local values = json.read_and_decode(values_file_dir)

	if vim.fn.empty(values) > 0 and child_call ~= true then
		os.execute("cp " .. example_file_dir .. " " .. values_file_dir)
		return self:read_or_create_values(true)
	end

	return values
end

--- Reads the configuration from the JSON files and merges them
function Config:read()
	local json = require("utils.json")

	local defaults = json.read_and_decode(defaults_file_dir)
	local values = self:read_or_create_values()

	self.values = vim.tbl_deep_extend("force", defaults, values)
end

--- Gets a configuration value by key
--- @param key string The configuration key
--- @return table|string|nil|number|boolean value
function Config:get(key)
	if type(self.values) ~= "table" then
		self:read()
	end

	if not key or type(key) ~= "string" then
		return nil
	end

	return self.values[key] or nil
end

--- Checks if a feature is enabled in the configuration
--- @param feature string The feature name to check
--- @return boolean enabled `true` if the feature is enabled, `false` otherwise
function Config:is_enabled(feature)
	if not feature or type(feature) ~= "string" then
		return false
	end

	return (self:get("toggles") or {})[feature] or false
end

local config = Config

return config
