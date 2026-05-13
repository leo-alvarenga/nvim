local M = {}

---Set current colorscheme
function M.set()
	local ui = require("values.ui")
	vim.cmd("colorscheme " .. ui.theme)
end

return M
