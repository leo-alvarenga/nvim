local M = {}

function M.close_current()
	local curr = vim.api.nvim_buf_get_name(0)
	if curr:match("ministarter://") ~= nil then
		return
	end

	vim.cmd("bd")
	local buf_count = vim.fn.getbufinfo({ buflisted = 1 })

	if #buf_count > 2 then
		return
	end

	local has_only_empty = vim.iter(buf_count):all(function(buf)
		return #buf.name == 0
	end)

	if not has_only_empty then
		return
	end

	require("homecoming-nvim").open(true)
end

function M.is_actual_file()
	local buf_name = vim.api.nvim_buf_get_name(0)

	if buf_name == "" then
		return false
	end

	local pseudo_buff_matchers = {
		"/neo-tree filesystem",
		"oil://",
	}

	for _, ft in ipairs(pseudo_buff_matchers) do
		if buf_name:match(ft) then
			return false
		end
	end

	return true
end

return M
