local M = {}

local map = vim.api.nvim_set_keymap

vim.g.mapleader = nvlx.general.leader

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
    M.loader(nvlx.keybinds)
end

return M
