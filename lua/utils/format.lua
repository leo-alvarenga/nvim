local M = {}

M.auto_format = true

function M.format_current(args)
	require("conform").format(args)
end

function M.toggle_auto_format()
	M.auto_format = not M.auto_format

	local status = "enabled"

	if not M.auto_format then
		status = "disabled"
	end

	vim.notify("Format on save is now " .. status, vim.log.levels.INFO)
end

function M.format_if_enabled(args)
	if not M.auto_format then
		return
	end

	M.format_current(args)
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
