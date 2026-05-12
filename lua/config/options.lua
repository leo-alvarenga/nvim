-- Leader options

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.pack.get(nil, { info = false })

-- Control variables

local tabwidth = 4

local listchars = {
	tab = "| ",
	trail = "·",
	nbsp = "␣",
}

local scroll_off = 10

-- Options

-- vim.pack
vim.opt.pp:prepend(vim.fn.stdpath("data") .. "/site/pack")

-- Basics
vim.o.expandtab = true -- Convert tabs to spaces
vim.o.shiftwidth = tabwidth -- Amount to indent with << and >>
vim.o.tabstop = tabwidth -- How many spaces are shown per Tab
vim.o.softtabstop = tabwidth -- How many spaces are applied when pressing Tab
vim.o.wrap = false
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.list = true
vim.opt.listchars = listchars
vim.o.scrolloff = scroll_off
vim.o.sidescrolloff = scroll_off
vim.o.number = true
vim.o.relativenumber = true

-- Show line under cursor
vim.o.cursorline = true
vim.g.neovim_terminfo_sync_output = 0 -- Fix cursorline performance issues in Neovim 0.10

-- Store undos between sessions
vim.o.undofile = true

-- Indentation
vim.o.smarttab = true
vim.o.smartindent = true
vim.o.autoindent = true -- Keep identation from previous line
vim.o.breakindent = true -- Enable break indent

-- Files
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
vim.o.updatetime = 300 -- Make completion faster
vim.o.autoread = true -- Ensure files changes outside current vim session are loaded
vim.o.autowrite = false

-- Search
vim.o.ignorecase = true -- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.smartcase = true
vim.o.incsearch = true -- Show search results incremently as you type

-- Diagnostics
vim.diagnostic.config({ virtual_text = false })

-- Visual settings
vim.o.termguicolors = true -- Enable 24-bit colors
vim.o.signcolumn = "yes" -- Always show sign column
vim.o.showmatch = true -- Highlight matching brackets
vim.o.matchtime = 5 -- How long to show matching bracket
vim.o.laststatus = 3 -- Global statusline
vim.o.cmdheight = 1 -- Command line height
vim.o.completeopt = "menuone,noinsert,noselect" -- Completion options
vim.o.showmode = false -- Don't show mode in command line
vim.o.pumheight = 10 -- Popup menu height
vim.o.pumblend = 10 -- Popup menu transparency
vim.o.winblend = 0 -- Floating window transparency
vim.o.conceallevel = 0 -- Don't hide markup
vim.o.concealcursor = "" -- Don't hide cursor line markup
vim.o.synmaxcol = 300 -- Syntax highlighting limit
vim.o.winborder = "rounded" -- Rounded border for floating windows

-- Behavior settings
vim.o.hidden = true -- Allow hidden buffers
vim.o.errorbells = false -- No error bells
vim.o.backspace = "indent,eol,start" -- Better backspace behavior
vim.o.autochdir = false -- Don't auto change directory
vim.opt.path:append("**") -- include subdirectories in search
vim.o.selection = "inclusive" -- Selection behavior - incluse include the starting char
vim.o.mouse = "a" -- Enable mouse support
vim.o.modifiable = true -- Allow buffer modifications
vim.o.encoding = "UTF-8" -- Set encoding

-- Folding settings
vim.o.foldmethod = "expr" -- Use expression for folding
vim.o.foldexpr = "nvim_treesitter#foldexpr()" -- Use treesitter for folding
vim.o.foldlevel = 99 -- Start with all folds open
