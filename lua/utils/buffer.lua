local _shared = require("utils.constants.shared")

local M = {}

function M.close_current()
	local buf_count = #vim.fn.getbufinfo({ buflisted = 1 })

	if buf_count > 1 then
		vim.cmd("bnext | bd #")

		return
	end

	require("plugins.ui.dashboard").config()
	vim.cmd("bd | " .. _shared.dashboard.cmd)
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
