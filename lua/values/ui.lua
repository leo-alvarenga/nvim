local M = {}

M.theme = "onedark"

M.logo = {
	"⠀⠀⠀⠀⣠⣤⣶⣶⣶⣤⣄⡀⠀",
	"⠀⠀⣴⣾⣿⣿⣿⣿⣿⣧⡀⠈⠢",
	"⠀⣼⣿⣿⣿⣿⣿⣿⣿⡿⠁⠀⠀",
	"⢰⡿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀",
	"⠘⣽⡿⠿⠿⣿⣿⣿⣿⣿⣦⣤⡀",
	"⠀⣟⠀⠀⠀⣸⣿⡏⠀⠀⠀⢹⠗",
	"⠀⣿⣷⣶⣾⡿⠁⠙⣄⣀⣀⣠⡀",
	"⠀⠙⠙⢿⡿⣷⣶⣤⣿⣿⡿⠿⠃",
	"⠀⠀⠀⠺⡏⡏⡏⡏⡏⠉⠁⠀⠀",
	"⠀⠀⠀⠀⠀⠀⠁⠁⠀⠀⠀⠀⠀",
}

M.title = {
	" _   _            _   _ _           ",
	"| \\ | |          | | | (_)          ",
	"|  \\| | ___  ___ | | | |_ _ __ ___  ",
	"| . ` |/ _ \\/ _ \\| | | | | '_ ` _ \\ ",
	"| |\\  |  __/ (_) \\ \\_/ / | | | | | |",
	"\\_| \\_/\\___|\\___/ \\___/|_|_| |_| |_|",
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
