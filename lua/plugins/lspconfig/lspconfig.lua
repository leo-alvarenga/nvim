return {
	"neovim/nvim-lspconfig",
	dependencies = { "saghen/blink.cmp" },
	config = function()
		local _langs = require("utils.constants.languages")
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		local on_attach = function(_, bufnr)
			local opts = { buffer = bufnr, silent = true, desc = "Go to definition" }
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		end

		for _i, server in ipairs(_langs.lang_server_list) do
			local config = vim.lsp.config[server]

			if server == "lua_ls" then
				config.settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
						workspace = {
							library = {
								vim.env.VIMRUNTIME,
							},

							checkThirdParty = false,
						},
						telemetry = { enable = false },
					},
				}
			end

			local final_config = vim.tbl_deep_extend("force", config, {
				capabilities = capabilities,
				on_attach = on_attach,
			})

			vim.lsp.config[server] = final_config
			vim.lsp.enable(server)
		end
	end,
}
