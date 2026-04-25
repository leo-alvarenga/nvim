--- @type PluginSpec
return {
	name = "lint",
	src = "gh:mfussenegger/nvim-lint",
	data = {
		config = function()
			local web_lint_combo = { "eslint_d", "ast-grep", stop_after_first = true }
			local css_lint = { "stylelint" }

			local lint = require("lint")

			if not lint.setup then
				return
			end

			lint.setup({
				linters_by_ft = {
					-- Basics
					bash = { "shellharden", "shfmt", stop_after_first = true },
					json = { "jsonlint" },
					lua = { "stylua" },

					-- DevOps and Infra
					terraform = { "terraform" },
					helm = { "kube-linter" },
					smarty = { "kube-linter" }, -- Some helm files are described as smarty
					yaml = { "sonarlint-language-server" },

					-- Web dev
					css = css_lint,
					scss = css_lint,
					html = { "htmlhint" },
					htmx = { "htmlhint" },
					jsx = web_lint_combo,
					tsx = web_lint_combo,
					javascriptreact = web_lint_combo,
					typescriptreact = web_lint_combo,
					javascript = web_lint_combo,
					typescript = web_lint_combo,

					-- Misc
					rust = { "ast-grep" },
				},
			})
		end,
	},
}
