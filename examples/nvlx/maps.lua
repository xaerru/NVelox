return {
    command = {},

    insert = {
        { "jk", "<ESC>" },
        { "kj", "<ESC>" },
    },

    normal = {
        ["Y"] = "y$",
        ["n"] = "nzzzv",
        ["N"] = "Nzzzv",
        ["J"] = "mzJ`z",
        ["<TAB>"] = ":BufferLineCycleNext<CR>",
        ["<S-TAB>"] = ":BufferLineCyclePrev<CR>",
        ["<CR>"] = ":noh<CR>",
    },

    object = {},

    visual = {
        ["<"] = "<gv",
        [">"] = ">gv",
    },
}
