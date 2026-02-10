local ts_specific_settings = {
	typescript = {
		preferences = {
			importModuleSpecifier = "auto",
			includeCompletionsForModuleExports = true,
			includeInlayParameterNameHints = "all",
		},
	},
	javascript = {
		preferences = {
			importModuleSpecifier = "auto",
			includeCompletionsForModuleExports = true,
		},
	},
}

local specific_settings = {
	lua_ls = {
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
	},
	tsserver = ts_specific_settings,
	tsgo = ts_specific_settings,
}

local function on_attach(_, bufnr)
	local opts = { buffer = bufnr, silent = true, desc = "Go to definition" }

	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
end

local function get_config(capabilities, server)
	local config = vim.lsp.config[server]
	local extras = specific_settings[server]

	if extras then
		config.settings = extras
	end

	return vim.tbl_deep_extend("force", config, {
		capabilities = capabilities,
		on_attach = on_attach,
	})
end

return {
	"neovim/nvim-lspconfig",
	dependencies = { "saghen/blink.cmp" },
	config = function()
		local lsps = require("utils.config"):get("development").lsps or {}
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		for _i, server in ipairs(lsps) do
			vim.lsp.config[server] = get_config(capabilities, server)
			vim.lsp.enable(server)
		end
	end,
}
