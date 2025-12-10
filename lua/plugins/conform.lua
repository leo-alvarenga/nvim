local static_web_fmt_combo = { "prettier", "ast-grep", stop_after_first = true }
local web_fmt_combo = { "prettierd", "prettier", stop_after_first = true }

return {
	-- Apply formatters
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			-- Basics
			bash = { "shellharden", "shfmt", stop_after_first = true },
			json = { "prettier" },
			lua = { "stylua" },
			markdown = { "prettier" },

			-- DevOps and Infra
			terraform = { "terraform" },
			yaml = { "prettier", "helm_ls" },

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
			python = { "ast-grep" },
		},
	},
}
