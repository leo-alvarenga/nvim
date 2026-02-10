require("utils.config"):read()

local keymaps = require("config.keymaps")
local theme = require("utils.theme")

require("config.options")
keymaps.setup_keymaps()

require("config.lazy")
theme.set()
