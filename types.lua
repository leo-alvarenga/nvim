--- @meta

--- @alias Theme
--- | "catppuccin"
--- | "everforest"
--- | "kanagawa"
--- | "onedark"
--- | "tokyonight"
--- | "nordic"
--- | "sonokai"
--- | "base16"

--- @class PluginKeys
--- @field mode string|string[] Mode(s) in which the keymap should be set
--- @field key string The key combination to map
--- @field command string|function The command or function to execute
--- @field desc string? Description for the keymap
--- @field opts table? Additional options for the keymap

--- @class PluginConfig
--- @field config function
--- @field keys PluginKeys[]?

--- @class PluginSpec
--- @field src string
--- @field data PluginConfig?
--- @field name string?
--- @field version (string|vim.VersionRange)?

return {}
