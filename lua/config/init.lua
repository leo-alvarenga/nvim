local keymaps = require("config.keymaps")
local theme = require("config.utils.theme")

require("config.options")
keymaps.setup_keymaps()

local plugins = require("config.plugins")
plugins.pack()

theme.set()
