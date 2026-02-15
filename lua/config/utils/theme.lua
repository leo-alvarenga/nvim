local M = {}

---Set current colorscheme
---@param theme string
function M.set()
	vim.cmd("colorscheme " .. require("values.ui").theme)
end

return M
