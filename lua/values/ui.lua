local M = {}

M.theme = "everforest"
M.border = "rounded"

-- Statusline/Tabline style: "bubble" (rounded pills) | "powerline" (slanted)
M.bar_style = "powerline"

M.logo = {
	"│ ╲ ││",
	"││╲╲││",
	"││ ╲ │",
}

M.title = {
	"",
}

M.banner = (function()
	local padding = string.rep(" ", 4)
	local lines = {}

	local offset = math.floor((#M.logo - #M.title) / 2)
	local empty_line = string.rep(" ", #M.title[1])

	for i, line in ipairs(M.logo) do
		local banner = ""
		if i > offset and i <= offset + #M.title then
			banner = banner .. (M.title[i - offset] or empty_line)
		else
			banner = banner .. empty_line
		end

		table.insert(lines, banner .. padding .. line)
	end

	return lines
end)()

return M
