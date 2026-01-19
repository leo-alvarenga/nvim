local M = {}

M.format_on_save = require("utils.config"):get("toggles").format_on_save or false

function M.get_formatters()
	local formatters_by_ft = require("utils.config"):get("development").formatters_by_ft or {}
	local formatters = {}

	vim.iter(formatters_by_ft):each(function(ft)
		if type(ft) ~= "table" or type(ft.formatters) ~= "table" then
			return
		end

		vim.iter(ft.formatters):each(function(formatter)
			table.insert(formatters, formatter)
		end)
	end)

	return formatters
end

function M.format_current(args)
	require("conform").format(args)
end

function M.toggle_format_on_save()
	M.format_on_save = not M.format_on_save

	local status = "enabled"

	if not M.format_on_save then
		status = "disabled"
	end

	vim.notify("Format on save is now " .. status, vim.log.levels.INFO)
end

function M.format_if_enabled(args)
	if not M.format_on_save then
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
