--- @type PluginSpec[]
return {
	require("config.plugins.plugins.misc.render-markdown"),
	require("config.plugins.plugins.misc.todo-comments"),
	require("config.plugins.plugins.misc.twilight"),
	require("config.plugins.plugins.misc.which-key"),

	--- Personal plugins
	require("config.plugins.plugins.misc.quoth"),
}
