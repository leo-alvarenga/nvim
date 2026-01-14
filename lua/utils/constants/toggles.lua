local toggle_file_path = vim.fn.stdpath("config") .. "/toggles.json"

local function read_toggles_file()
	local toggles = {}
	local file = io.open(toggle_file_path, "r")

	if file then
		local content = file:read("*a")
		toggles = vim.json.decode(content)

		file:close()
	end

	return toggles
end

return read_toggles_file()
