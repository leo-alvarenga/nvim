--- @type PluginSpec[]
return {
	require("plugins.code-completions.blink"),
	require("plugins.code-completions.conform"),
	require("plugins.code-completions.typescript-tools"),
	require("plugins.code-completions.nvim-lint"),
	require("plugins.code-completions.none-ls"),
}
