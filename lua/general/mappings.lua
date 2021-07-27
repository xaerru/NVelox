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

-- Don't copy deleted text
map("n", "dd", [=[ "_dd ]=], options)
map("v", "dd", [=[ "_dd ]=], options)
map("v", "x", [=[ "_x ]=], options)

-- Don't copy the replaced text after pasting in visual mode
map("v", "p", '"_dP', opt)

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

function _G.completions()
    local npairs = require("nvim-autopairs")

    if vim.fn.pumvisible() == 1 then
        if vim.fn.complete_info()["selected"] ~= -1 then
            return vim.fn["compe#confirm"]("<CR>")
        end
    end
    return npairs.check_break_line_char()
end

--  nvim-compe mappings
map("i", "<Tab>", "v:lua.tab_complete()", { expr = true })
map("s", "<Tab>", "v:lua.tab_complete()", { expr = true })
map("i", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })
map("s", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })
map("i", "<CR>", "v:lua.completions()", { expr = true })
