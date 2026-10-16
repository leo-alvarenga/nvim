--- @type PluginSpec[]
return {
	require("plugins.lsp.lspconfig"),
	require("plugins.lsp.mason"),
	require("plugins.lsp.mason-lspconfig"),
	require("plugins.lsp.mason-tool-installer"),
}
