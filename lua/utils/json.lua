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

--- Writes to a JSON file (upsert)
---@param file_path string
---@param content table
function M.write(file_path, content)
	if type(file_path) ~= "string" or type(content) ~= "table" then
		return
	end

	local file = io.open(file_path, "w+")

	if file then
		file:write(vim.json.encode(content))
	end
end

return M
