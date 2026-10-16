--- @type PluginSpec
return {
	name = "typescript-tools",
	src = "gh:pmizio/typescript-tools.nvim",
	data = {
		config = function()
			-- typescript-tools requires tsserver.js, removed in TypeScript 7
		end,
	},
}
