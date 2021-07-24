local map = vim.api.nvim_set_keymap

options = { noremap = true }
silent_options = { noremap = true, silent = true }

-- Use jk instead of ESC
map("i", "jk", "<ESC>", options)
map("i", "kj", "<ESC>", options)

-- Move one character ahead in insert mode
map("i", "jj", "<Right>", options)

-- Navigate between buffers
map("n", "<TAB>", ":BufferLineCycleNext<CR>", silent_options)
map("n", "C-<TAB>", ":BufferLineCyclePrev<CR>", silent_options)

-- Better tabs
map("v", "<", "<gv", options)
map("v", ">", ">gv", options)

-- Turn highlighting off on enter
map("n", "<CR>", ":noh<CR>", silent_options)

-- Exit the terminal
map("t", "<ESC>", "<C-d>:bd", options)
