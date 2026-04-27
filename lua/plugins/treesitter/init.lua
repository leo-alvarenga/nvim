--- @type PluginSpec[]
return {
	require("plugins.treesitter.treesitter"),
	require("plugins.treesitter.treesitter-context"),
	require("plugins.treesitter.treesitter-textobjects"),
	require("plugins.treesitter.ts-autotag"),
	require("plugins.treesitter.ts-comments"),
}
