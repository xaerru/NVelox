local M = {}

local map = vim.api.nvim_set_keymap

local modes = {
    insert = "i",
    normal = "n",
    terminal = "t",
    visual = "v",
    visual_block = "x",
    command = "c",
    object = "o",
}

local keybinds = {
    insert = {
        --
        ["jk"] = "<ESC>",
        ["kj"] = "<ESC>",
        --
        ["jj"] = "<Right>",
        --
        ["<C-j>"] = "<ESC>:m .+1<CR>==i",
        ["<C-k>"] = "<ESC>:m .-2<CR>==i",
        --
        [";;"] = "<ESC>A;",
    },
    normal = {
        [";"] = ":",
        ["Y"] = "y$",
        ["n"] = "nzzzv",
        ["N"] = "Nzzzv",
        ["J"] = "mzJ`z",
        ["<leader>j"] = "<ESC>:m .+1<CR>==",
        ["<leader>k"] = "<ESC>:m .-2<CR>==",
        ["<TAB>"] = ":BufferLineCycleNext<CR>",
        ["C-<TAB>"] = ":BufferLineCyclePrev<CR>",
        ["<CR>"] = ":noh<CR>",
    },
    command = {},
    visual = {
        ["<"] = "<gv",
        [">"] = ">gv",
        ["im"] = ":lua require('tsht').nodes()<CR>",
    },
    object = {
        ["im"] = ":lua require('tsht').nodes()<CR>",
    },
    visual_block = {
        ["J"] = ":m '>+1<CR>gv=gv",
        ["K"] = ":m '<-2<CR>gv=gv",
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

function M.load()
    for mode, maps in pairs(keybinds) do
        M.load_mode(mode, maps)
    end
end

return M
