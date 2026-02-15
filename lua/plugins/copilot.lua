local is_enabled = require("values.plugins").is_enabled

return {
	"github/copilot.vim",
	enabled = is_enabled("copilot") or is_enabled("sidekick"),
	version = false,
}
