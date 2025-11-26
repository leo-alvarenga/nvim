local _buffer = require("config.utils.buffer")
local _format = require("config.utils.format")
local _keymap = require("config.utils.keymap")
local _shared = require("config.utils.constants.shared")
local _workspaces = require("config.utils.workspaces")

local map = _keymap.map
local to_cmd = _keymap.to_cmd

local M = {}
-------------------------------------------------

---------------------
--  _buffer management
function M.buffer_management()
	map("", "<leader>h", ":bprevious<cr>", "Go to previous _buffer")
	map("", "<leader>l", ":bnext<cr>", "Go to next _buffer")

	-- Open new _buffer
	map("", "<leader>n", ":enew<CR>", "Open new empty _buffer")

	-- Close current _buffer
	map("", "<leader>q", _buffer.close_current, "Close current Buffer (go to Dashboard if it's the last one)")
end
---------------------

function M.tab_management()
	local tab_prefix = "<C-t>"

	map("", tab_prefix .. "h", ":tabprevious<cr>", "Go to previous Tab")
	map("", tab_prefix .. "l", ":tabnext<cr>", "Go to next Tab")

	map("", tab_prefix .. "n", ":tabnew<CR>", "Open new empty Tab")

	map("", tab_prefix .. "q", ":tabclose<CR>", "Close current Tab")

	map("", tab_prefix .. "o", ":tabonly<CR>", "Close all tabs (except for the current one)")
end

-- Basics and Helix related keymappings
function M.setup_basics()
	---------------------
	--  Undo/Redo
	map("", "u", ":undo<CR>", "Undo")
	map("", "U", ":redo<CR>", "Redo")
	---------------------

	M.buffer_management()
	M.tab_management()

	---------------------
	-- Motions inspired by Helix :D
	-- Ensuring selection is kept after indentation
	map("x", "<", "<gv")
	map("x", ">", ">gv")

	-- Going to start of the line with 'gh'
	map("", "gh", "0")

	-- Going to end of the line with 'gl'
	map("", "gl", "$")

	-- Going to end of the file with 'ge'
	map("", "ge", "G")
	---------------------

	---------------------
	-- Helix-like selection
	-- Whole line selection (downwards) with 'x'
	map("n", "x", "0v$j")
	map("x", "x", "0$j")

	-- Whole line selection (upwards) with 'x'
	map("n", "X", "0v$k")
	map("x", "X", "0$k")
	---------------------
end
-------------------------------------------------

-------------------------------------------------
-- Formatting and Diagnostics
function M.setup_fmt()
	map({ "", "i" }, "<C-s>", _format.format_current, "Format file (if possible)")
end
-------------------------------------------------

-------------------------------------------------
-- Oil keymaps
function M.setup_oil()
	map("", "<leader>e", ":Oil<CR>", "Explore current directory using Oil")
end
-------------------------------------------------

-------------------------------------------------
-- Twilight keymaps
function M.setup_twilight()
	local twilight = require("config.utils.twilight")

	map("", "<C-e>", twilight.toggle_twilight, "Toggle Twilight dim")
end
-------------------------------------------------

-------------------------------------------------
-- Git related keymaps
function M.setup_git()
	map("", "<C-g>", to_cmd(_shared.git.blame.cmd), "Toggle git-blame")
end

-------------------------------------------------

-----------------
-- Grapple
-----------------

function M.setup_grapple()
	map("", "<leader>m", ":Grapple toggle<cr>", "Grapple - Toggle tag")
	map("", "<leader>n", ":Grapple cycle_tags next<cr>", "Grapple - Cycle next tag")
	map("", "<leader>p", ":Grapple cycle_tags prev<cr>", "Grapple - Cycle previous tag")
end

-------------------------------------------------

-----------------
-- Telescope
-----------------
function M.setup_telescope()
	local telescope = require("telescope")

	local telescope_picker_opts = {
		theme = "dropdown",
	}

	telescope.setup({
		buffers = telescope_picker_opts,
		fd = telescope_picker_opts,
		grapple = telescope_picker_opts,
		help_tags = telescope_picker_opts,
		live_grep = telescope_picker_opts,
		workspaces = telescope_picker_opts,
	})

	local builtin = require("telescope.builtin")

	map("n", "<leader>f", function()
		builtin.fd({ hidden = true })
	end, "Telescope - Find files")

	map("", "<leader>g", builtin.git_files, "Telescope - Git files")

	map("", "<leader>F", function()
		builtin.live_grep({ hidden = true })
	end, "Telescope - Live grep")

	map("", "<leader>c", builtin.buffers, "Telescope - Buffers")

	map("", "<leader>C", builtin.help_tags, "Telescope - help tags")
	map("", "<leader>w", ":" .. _shared.telescope.workspaces.cmd .. "<CR>", "Telescope - Workspaces")

	map("", "<leader>M", ":Telescope grapple tags<cr>", "Telescope - Open Grapple tags window")
	map("", "<leader>W", _workspaces.manage_workspaces, "Telescope - Manage workspaces")

	telescope.load_extension("grapple")
	telescope.load_extension("workspaces")
end
-------------------------------------------------

-------------------------------------------------
-- Main setup
function M.setup_keymaps()
	M.setup_basics()
	M.setup_fmt()
	M.setup_oil()
	M.setup_git()
	M.setup_twilight()
end
-------------------------------------------------

return M
