local M = {}

M.format_on_save = require("values.workflow").format_on_save

function M.format_current(args, auto)
	if not auto then
		vim.notify(require("values.constants.shared").format.notifications.manual, vim.log.levels.INFO)
	end

	require("conform").format(args)
end

function M.toggle_format_on_save()
	M.format_on_save = not M.format_on_save

	local _shared = require("values.constants.shared")

	local status = "enabled"

	if not M.format_on_save then
		status = "disabled"
	end

	vim.notify(_shared.format.notifications[status], vim.log.levels.INFO)
end

function M.format_if_enabled(args)
	if not M.format_on_save then
		return
	end

	M.format_current(args, true)
end

function M.setup_autocmd()
	vim.api.nvim_create_autocmd("BufWritePre", {
		pattern = "*",
		callback = function(args)
			M.format_if_enabled({ bufnr = args.buf })
		end,
	})
end

return M
