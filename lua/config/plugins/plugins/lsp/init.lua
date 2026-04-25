--- @type PluginSpec[]
return {
	require("config.plugins.plugins.lsp.lspconfig"),
	require("config.plugins.plugins.lsp.mason"),
	require("config.plugins.plugins.lsp.mason-lspconfig"),
	require("config.plugins.plugins.lsp.mason-tool-installer"),
}
