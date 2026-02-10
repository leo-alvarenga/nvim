local function get_copilot()
	local copilot_enabled = require("utils.config"):get("toggles").copilot or false

	if not copilot_enabled then
		return {}
	end

	return {
		"github/copilot.vim",
		version = false,
	}
end

return get_copilot()
