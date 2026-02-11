local function get_copilot()
	local config = require("utils.config")
	local copilot_enabled = config:is_enabled("plugins", "copilot") or config:is_enabled("plugins", "sidekick")

	if not copilot_enabled then
		return {}
	end

	return {
		"github/copilot.vim",
		version = false,
	}
end

return get_copilot()
