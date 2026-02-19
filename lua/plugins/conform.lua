local static_web_fmt_combo = { "prettier", "ast-grep", stop_after_first = true }
local web_fmt_combo = { "prettier", stop_after_first = true }

local opts = {
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
		css = static_web_fmt_combo,
		scss = static_web_fmt_combo,
		html = static_web_fmt_combo,
		htmx = static_web_fmt_combo,
		jsx = web_fmt_combo,
		tsx = web_fmt_combo,
		javascriptreact = web_fmt_combo,
		typescriptreact = web_fmt_combo,
		javascript = web_fmt_combo,
		typescript = web_fmt_combo,

		-- Misc
		rust = { "ast-grep" },
	},
}

return {
	-- Apply formatters
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup(opts)

		local _keymap = require("config.utils.keymap")

		local map = _keymap.map
		local with_prefix = _keymap.with_prefix

		local _format = require("config.utils.format")
		_format.setup_autocmd()

		map({ "", "i" }, with_prefix("", "formatters"), "", "   Formatter actions")
		map({ "", "i" }, with_prefix("s", "formatters"), _format.format_current, "Format file (if possible)")
		map({ "", "i" }, with_prefix("S", "formatters"), _format.toggle_format_on_save, "Toggle format on save")
	end,
}
