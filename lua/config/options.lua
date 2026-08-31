local ui = require("values.ui")

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local tabwidth = 4

local listchars = {
	tab = "| ",
	trail = "·",
	nbsp = "␣",
}

local scroll_off = 10

vim.opt.pp:prepend(vim.fn.stdpath("data") .. "/site/pack")

vim.o.expandtab = true
vim.o.shiftwidth = tabwidth
vim.o.tabstop = tabwidth
vim.o.softtabstop = tabwidth
vim.o.wrap = false
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.list = true
vim.opt.listchars = listchars
vim.o.scrolloff = scroll_off
vim.o.sidescrolloff = scroll_off
vim.o.number = true
vim.o.relativenumber = true

vim.o.cursorline = true
vim.g.neovim_terminfo_sync_output = 0 -- Fix cursorline performance issues in Neovim 0.10

vim.o.undofile = true

vim.o.smarttab = true
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.breakindent = true

vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
vim.o.updatetime = 300
vim.o.autoread = true
vim.o.autowrite = false

vim.o.ignorecase = true -- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.smartcase = true
vim.o.incsearch = true

vim.diagnostic.config({ virtual_text = false })

vim.o.termguicolors = true
vim.o.signcolumn = "yes"
vim.o.showmatch = true
vim.o.matchtime = 5
vim.o.laststatus = 3
vim.o.cmdheight = 0
vim.o.completeopt = "menuone,noinsert,noselect"
vim.o.showmode = false
vim.o.pumheight = 10
vim.o.pumblend = 10
vim.o.winblend = 0
vim.o.conceallevel = 0
vim.o.concealcursor = ""
vim.o.synmaxcol = 300
vim.o.winborder = ui.border

vim.o.hidden = true
vim.o.errorbells = false
vim.o.backspace = "indent,eol,start"
vim.o.autochdir = false
vim.opt.path:append("**")
vim.o.selection = "inclusive"
vim.o.mouse = "a"
vim.o.modifiable = true
vim.o.encoding = "UTF-8"

vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevel = 99
