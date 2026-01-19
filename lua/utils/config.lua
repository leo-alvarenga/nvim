local defaults_file_dir = vim.fn.stdpath("config") .. "/defaults.json"
local values_file_dir = vim.fn.stdpath("config") .. "/values.json"

Config = { values = {} }

--- Reads the configuration from the JSON files and merges them
function Config:read()
	local json = require("utils.json")

	local defaults = json.read_and_decode(defaults_file_dir)
	local values = json.read_and_decode(values_file_dir)

	self.values = vim.tbl_deep_extend("force", defaults, values)
end

--- Gets a configuration value by key
--- @param key string The configuration key
--- @return any|nil The configuration value
function Config:get(key)
	if type(self.values) ~= "table" then
		self:read()
	end

	if not key or type(key) ~= "string" then
		return nil
	end

	return self.values[key] or nil
end

local config = Config

return config
