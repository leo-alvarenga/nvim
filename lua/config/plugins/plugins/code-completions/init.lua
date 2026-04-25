--- @type PluginSpec[]
return {
	require("config.plugins.plugins.code-completions.blink"),
	require("config.plugins.plugins.code-completions.conform"),
	require("config.plugins.plugins.code-completions.typescript-tools"),
	require("config.plugins.plugins.code-completions.nvim-lint"),
	require("config.plugins.plugins.code-completions.none-ls"),
}
