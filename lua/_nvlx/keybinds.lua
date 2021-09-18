local M = {}

local map = vim.api.nvim_set_keymap

vim.g.mapleader = nvlx.general.leader

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

local modes = {
    command = "c",
    insert = "i",
    normal = "n",
    object = "o",
    terminal = "t",
    visual = "v",
    visual_block = "x",
}

local default_keybinds = {
    command = {},

    insert = {
        ["jk"] = "<ESC>",
        ["kj"] = "<ESC>",
    },

    normal = {
        ["Y"] = "y$",
        ["n"] = "nzzzv",
        ["N"] = "Nzzzv",
        ["J"] = "mzJ`z",
        ["<TAB>"] = ":BufferLineCycleNext<CR>",
        ["C-<TAB>"] = ":BufferLineCyclePrev<CR>",
        ["<CR>"] = ":noh<CR>",
    },

    object = {},

    visual = {
        ["<"] = "<gv",
        [">"] = ">gv",
    },
}

function M.load_mode(mode, maps)
    mode = modes[mode]
    for key, mapping in pairs(maps) do
        if type(mapping) == "table" then
            local opts = mapping[1].opts or { noremap = true, silent = true }
            map(mode, key, mapping[1], opts)
        end
        map(mode, key, mapping, { noremap = true, silent = true })
    end
end

function M.loader(keybinds)
    for mode, maps in pairs(keybinds) do
        M.load_mode(mode, maps)
    end
end

function M.load()
    M.loader(default_keybinds)
    M.loader(nvlx.keybinds.general)
    map("i", "<Tab>", "v:lua.tab_complete()", { expr = true })
    map("s", "<Tab>", "v:lua.tab_complete()", { expr = true })
    map("i", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })
    map("s", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })

    map("i", "<C-Space>", "compe#complete()", { noremap = true, silent = true, expr = true })
    map("i", "<C-e>", "compe#close('<C-e>')", { noremap = true, silent = true, expr = true })
    map(
        "i",
        "<C-f>",
        "compe#scroll({ 'delta': +4 })",
        { noremap = true, silent = true, expr = true }
    )
    map(
        "i",
        "<C-d>",
        "compe#scroll({ 'delta': -4 })",
        { noremap = true, silent = true, expr = true }
    )
end

return M
