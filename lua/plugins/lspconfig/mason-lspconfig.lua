return {
	-- Manage integrates LSPs installed via Mason with Neovim LSP API
	"mason-org/mason-lspconfig.nvim",
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
	},
	opts = {
		automatic_enable = true,
	},
}
