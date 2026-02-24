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

M.banner = {
	(function()
		local banner = ""
		local padding = string.rep(" ", 4)

		local offset = math.floor((#M.logo - #M.title) / 2)
		local empty_line = string.rep(" ", #M.title[1])

		for i, line in ipairs(M.logo) do
			if i > offset and i <= offset + #M.title then
				banner = banner .. (M.title[i - offset] or empty_line)
			else
				banner = banner .. empty_line
			end

			banner = banner .. padding .. line .. "\n"
		end

		return banner
	end)(),
}

return M
