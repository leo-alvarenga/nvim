-- Leader options

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Control variables

local tabwidth = 4

local tabchar = "» "
local trailingspacechar = "·"
local nbspchar = "␣"

local scroll_off = 10

-- Options

-- Basics
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.shiftwidth = tabwidth -- Amount to indent with << and >>
vim.opt.tabstop = tabwidth -- How many spaces are shown per Tab
vim.opt.softtabstop = tabwidth -- How many spaces are applied when pressing Tab
vim.opt.wrap = false
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = tabchar, trail = trailingspacechar, nbsp = nbspchar }
vim.opt.scrolloff = scroll_off
vim.opt.sidescrolloff = scroll_off
vim.opt.number = true
vim.opt.relativenumber = true

-- Show line under cursor
vim.opt.cursorline = true

-- Store undos between sessions
vim.opt.undofile = true

-- Indentation
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.autoindent = true -- Keep identation from previous line
vim.opt.breakindent = true -- Enable break indent
vim.opt.lazyredraw = true

-- Files
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.updatetime = 300 -- Make completion faster
vim.opt.autoread = true -- Ensure files changes outside current vim session are loaded
vim.opt.autowrite = false

-- Search
vim.opt.ignorecase = true -- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.smartcase = true
vim.opt.incsearch = true -- Show search results incremently as you type

-- Diagnostics
vim.diagnostic.config({ virtual_text = true })

-- Visual settings
vim.opt.termguicolors = true -- Enable 24-bit colors
vim.opt.signcolumn = "yes" -- Always show sign column
vim.opt.showmatch = true -- Highlight matching brackets
vim.opt.matchtime = 5 -- How long to show matching bracket
vim.opt.cmdheight = 1 -- Command line height
vim.opt.completeopt = "menuone,noinsert,noselect" -- Completion options
vim.opt.showmode = false -- Don't show mode in command line
vim.opt.pumheight = 10 -- Popup menu height
vim.opt.pumblend = 10 -- Popup menu transparency
vim.opt.winblend = 0 -- Floating window transparency
vim.opt.conceallevel = 0 -- Don't hide markup
vim.opt.concealcursor = "" -- Don't hide cursor line markup
vim.opt.lazyredraw = true -- Don't redraw during macros
vim.opt.synmaxcol = 300 -- Syntax highlighting limit

-- Behavior settings
vim.opt.hidden = true -- Allow hidden buffers
vim.opt.errorbells = false -- No error bells
vim.opt.backspace = "indent,eol,start" -- Better backspace behavior
vim.opt.autochdir = false -- Don't auto change directory
vim.opt.iskeyword:append("-") -- Treat dash as part of word
vim.opt.path:append("**") -- include subdirectories in search
vim.opt.selection = "inclusive" -- Selection behavior - incluse include the starting char
vim.opt.mouse = "a" -- Enable mouse support
vim.opt.modifiable = true -- Allow buffer modifications
vim.opt.encoding = "UTF-8" -- Set encoding

-- Folding settings
vim.opt.foldmethod = "expr" -- Use expression for folding
vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- Use treesitter for folding
vim.opt.foldlevel = 99 -- Start with all folds open
