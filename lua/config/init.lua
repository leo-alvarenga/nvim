local keymaps = require("config.keymaps")
local theme = require("config.utils.theme")

require("config.options")
keymaps.setup_keymaps()

require("config.lazy")
theme.set()
