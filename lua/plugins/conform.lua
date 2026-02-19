local M = {}

M.format_on_save = require("values.workflow").format_on_save

--- Formats the current buffer using Conform
--- @param args table: Arguments to pass to Conform's format function
--- @param silent boolean: Whether to suppress notifications (default: false)
function M.format_current(args, silent)
	if not silent then
		vim.notify(require("values.constants.shared").format.notifications.manual, vim.log.levels.INFO)
	end

	require("conform").format(args)
end

--- Toggles the format on save feature and notifies the user of the new status
function M.toggle_format_on_save()
	M.format_on_save = not M.format_on_save

	local _shared = require("values.constants.shared")

	local status = "enabled"

	if not M.format_on_save then
		status = "disabled"
	end

	vim.notify(_shared.format.notifications[status], vim.log.levels.INFO)
end

--- Checks if format on save is enabled and formats the current buffer if it is
--- @param args table: Arguments to pass to Conform's format function
function M.format_if_enabled(args)
	if not M.format_on_save then
		return
	end

	M.format_current(args, true)
end

--- Sets up an autocmd to format the buffer before saving if format on save is enabled
function M.setup_autocmd()
	vim.api.nvim_create_autocmd("BufWritePre", {
		pattern = "*",
		callback = function(args)
			M.format_if_enabled({ bufnr = args.buf })
		end,
	})
end

M.static_web_fmt_combo = { "prettier", "ast-grep", stop_after_first = true }
M.web_fmt_combo = { "prettier", stop_after_first = true }

M.opts = {
	formatters_by_ft = {
		-- Basics
		bash = { "shellharden", "shfmt", stop_after_first = true },
		json = { "prettier", "jq", stop_after_first = true },
		lua = { "stylua" },
		markdown = { "prettier" },

		-- DevOps and Infra
		terraform = { "terraform" },
		yaml = { "yamlfmt", "prettier", "helm_ls" },

		-- Web dev
		css = M.static_web_fmt_combo,
		scss = M.static_web_fmt_combo,
		html = M.static_web_fmt_combo,
		htmx = M.static_web_fmt_combo,
		jsx = M.web_fmt_combo,
		tsx = M.web_fmt_combo,
		javascriptreact = M.web_fmt_combo,
		typescriptreact = M.web_fmt_combo,
		javascript = M.web_fmt_combo,
		typescript = M.web_fmt_combo,

		-- Misc
		rust = { "ast-grep" },
	},
}

return {
	-- Apply formatters
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup(M.opts)

		local _keymap = require("config.utils.keymap")

		local map = _keymap.map
		local with_prefix = _keymap.with_prefix

		M.setup_autocmd()

		map({ "", "i" }, with_prefix("", "formatters"), "", "   Formatter actions")
		map({ "", "i" }, with_prefix("s", "formatters"), M.format_current, "Format file (if possible)")
		map({ "", "i" }, with_prefix("S", "formatters"), M.toggle_format_on_save, "Toggle format on save")
	end,
}
