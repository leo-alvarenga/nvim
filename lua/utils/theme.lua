local M = {}

---Set current colorscheme
---@param theme string
function M.set()
	local _config = require("utils.config")
	vim.cmd("colorscheme " .. (_config:get("theme") or "catppuccin"))
end

return M
