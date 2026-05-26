--- @type PluginSpec[]
return {
	-- Leaving this here for now; nvim-treesitter is currently archived, this is my fallback plan in case the project is fully dropped
	-- require("plugins.treesitter.arborist"),

	require("plugins.treesitter.treesitter"),
	require("plugins.treesitter.treesitter-context"),
	require("plugins.treesitter.treesitter-textobjects"),
	require("plugins.treesitter.ts-autotag"),
	require("plugins.treesitter.ts-comments"),
}
