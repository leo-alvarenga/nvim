local mark = require('harpoon.mark')
local ui = require('harpoon.ui')

-- add or removes file to/from harpoon list, depending on whether or not the file is already there
vim.keymap.set('n', '<leader>a', mark.toggle_file)

-- clear the file list
vim.keymap.set('n', '<leader>d', mark.clear_all)

-- show harpoon's file list
vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu)

-- cycle throught the files
vim.keymap.set('n', '<C-h>', function() ui.nav_next() end)
vim.keymap.set('n', '<C-l>', function() ui.nav_prev()end)
