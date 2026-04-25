--- @type PluginSpec[]
return {
	require("config.plugins.plugins.treesitter.treesitter"),
	require("config.plugins.plugins.treesitter.treesitter-context"),
	require("config.plugins.plugins.treesitter.treesitter-textobjects"),
	require("config.plugins.plugins.treesitter.ts-autotag"),
	require("config.plugins.plugins.treesitter.ts-comments"),
}
