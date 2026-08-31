local M = {}

M.colors = require("values.constants.shared").colors

M.file_formats = {
	unix = "",
	dos = "󰨡",
	mac = "",
}

M.mode_colors = {
	n = M.colors.info,
	i = M.colors.insert,
	v = M.colors.accent,
	V = M.colors.accent,
	["\22"] = M.colors.accent,
	[""] = M.colors.accent,
	c = M.colors.error,
	s = M.colors.warn,
	S = M.colors.warn,
	t = M.colors.error,
	unknown = M.colors.info,
}

M.mode_icons = {
	n = "󰷊",
	i = "󱇧",
	v = "󰩬",
	V = "󰩬",
	["\22"] = "󰩬",
	[""] = "󰩬",
	c = "",
	t = "",
	s = "󰩬",
	S = "󰩬",
	unknown = "",
	yazi = "󰙅",
}

M.mode_names = {
	n = "NORMAL",
	i = "INSERT",
	v = "VISUAL",
	V = "V-LINE",
	["\22"] = "V-BLOCK",
	c = "COMMAND",
	s = "SELECT",
	S = "SELECT",
	t = "TERMINAL",
	["!"] = "SHELL",
	unknown = "UNKNOWN",
	yazi = "Yazi",
}

M.ft_servers = {
	lua = "lua_ls",
	python = "pyright",
	["typescript"] = "tsserver",
	["javascript"] = "tsserver",
	rust = "rust-analyzer",
	go = "gopls",
	c = "clangd",
	cpp = "clangd",
	sh = "bashls",
	json = "jsonls",
	yaml = "yamlls",
	markdown = "marksman",
}

M.lsp_icons = {
	lua_ls = "",
	tsserver = "",
	vtsls = "",
	pyright = "",
	["rust-analyzer"] = "",
	gopls = "",
	clangd = "",
	bashls = "",
	jsonls = "",
	yamlls = "",
	marksman = "",
	["NO_LSP"] = "󱧖",
}

return M