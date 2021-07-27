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

-- nvim-ts-hint-textobject
map("o", "m", ":<C-U>lua require('tsht').nodes()<CR>", silent_options)
map("v", "m", ":lua require('tsht').nodes()<CR>", silent_options)

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
