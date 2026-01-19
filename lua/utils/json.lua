local M = {}

--- Reads a JSON file and decodes its content into a Lua table
---@param file_path string The path to the JSON file
---@return table The decoded Lua table or an empty table if an error occurs
function M.read_and_decode(file_path)
	local contents = {}

	if type(file_path) ~= "string" then
		return contents
	end

	local file = io.open(file_path, "r")

	if file then
		local lines = file:read("*a")
		contents = vim.json.decode(lines) or {}

		file:close()
	end

	return contents
end

return M
