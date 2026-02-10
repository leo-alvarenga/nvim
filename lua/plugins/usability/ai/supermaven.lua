local function get_supermaven()
	local supermaven_enabled = require("utils.config"):get("toggles").supermaven or false

	if not supermaven_enabled then
		return {}
	end

	return {
		"supermaven-inc/supermaven-nvim",
		opts = {},
		version = false,
	}
end

return get_supermaven()
