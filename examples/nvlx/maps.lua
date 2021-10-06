return {
    command = {},

    insert = {
        jk = "<ESC>",
        kj = "<ESC>",
    },

    normal = {
        ["<silent> Y"] = "y$",
        ["<silent> n"] = "nzzzv",
        ["<silent> N"] = "Nzzzv",
        ["<silent> J"] = "mzJ`z",
        ["<silent> <TAB>"] = ":BufferLineCycleNext<CR>",
        ["<silent> <S-TAB>"] = ":BufferLineCyclePrev<CR>",
        ["<silent> <CR>"] = ":noh<CR>",
    },

    object = {},

    visual = {
        ["<"] = "<gv",
        [">"] = ">gv",
    },
}
