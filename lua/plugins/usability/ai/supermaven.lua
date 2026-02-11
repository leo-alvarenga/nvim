local function get_supermaven()
	if not require("utils.config"):is_enabled("plugins", "supermaven") then
		return {}
	end

	return {
		"supermaven-inc/supermaven-nvim",
		opts = {},
		version = false,
	}
end

return get_supermaven()
