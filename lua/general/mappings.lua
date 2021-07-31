local map = vim.api.nvim_set_keymap

local options = { noremap = true }
local silent_options = { noremap = true, silent = true }

-- Use jk instead of ESC
map("i", "jk", "<ESC>", options)
map("i", "kj", "<ESC>", options)

-- Smoother experience
map("n", "Y", "y$", options)
map("n", "n", "nzzzv", options)
map("n", "N", "Nzzzv", options)
map("n", "J", "mzJ`z", options)

-- Moving text
map("v", "J", ":m '>+1<CR>gv=gv", options)
map("v", "K", ":m '<-2<CR>gv=gv", options)
map("i", "<C-j>", "<ESC>:m .+1<CR>==i", options)
map("i", "<C-k>", "<ESC>:m .-2<CR>==i", options)
map("n", "<leader>j", "<ESC>:m .+1<CR>==", options)
map("n", "<leader>k", "<ESC>:m .-2<CR>==", options)

-- Rust, C, C++
map("i", ";;", "<ESC>A;", options)

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

-- nvim-ts-hint-textobject
map("o", "m", ":<C-U>lua require('tsht').nodes()<CR>", silent_options)
map("v", "im", ":lua require('tsht').nodes()<CR>", silent_options)

-- nvim-compe
local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col(".") - 1
    if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
        return true
    else
        return false
    end
end

_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t("<C-n>")
    elseif vim.fn.call("vsnip#available", { 1 }) == 1 then
        return t("<Plug>(vsnip-expand-or-jump)")
    elseif check_back_space() then
        return t("<Tab>")
    else
        return vim.fn["compe#complete"]()
    end
end

_G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t("<C-p>")
    elseif vim.fn.call("vsnip#jumpable", { -1 }) == 1 then
        return t("<Plug>(vsnip-jump-prev)")
    else
        return t("<S-Tab>")
    end
end

map("i", "<Tab>", "v:lua.tab_complete()", { expr = true })
map("s", "<Tab>", "v:lua.tab_complete()", { expr = true })
map("i", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })
map("s", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })

map("i", "<C-Space>", "compe#complete()", { noremap = true, silent = true, expr = true })
map("i", "<C-e>", "compe#close('<C-e>')", { noremap = true, silent = true, expr = true })
map("i", "<C-f>", "compe#scroll({ 'delta': +4 })", { noremap = true, silent = true, expr = true })
map("i", "<C-d>", "compe#scroll({ 'delta': -4 })", { noremap = true, silent = true, expr = true })
