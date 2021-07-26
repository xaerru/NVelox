local wk = require("which-key")

wk.register({
    ["<leader>f"] = { "<CMD>Neoformat | write<CR>", "Format" },
    ["<leader><TAB>"] = { "<CMD>:BufferLineCyclePrev<CR>", "Previous Buffer" },
    ["]c"] = "Next Git Hunk",
    ["[c"] = "Previous Git Hunk",
})

wk.register({
    t = {
        name = "terminal",
        g = { "<CMD>lua term_lazygit()<CR>", "lazygit" },
        --[[v = { "<CMD>FloatermNew --height=40 --width=0.5 --position=right<CR>", "Vertical" },
        h = { "<CMD>FloatermNew --height=0.5 --width=0.99 --position=top<CR>", "Horizontal" },
        f = { "<CMD>FloatermNew --height=40 --width=0.99<CR>", "Full" },]]
    },
}, {
    prefix = "<leader>",
})

wk.register({
    p = {
        name = "telescope",
        p = { "<CMD>Telescope<CR>", "Telescope" },
        f = { "<CMD>Telescope find_files<CR>", "Find Files" },
        h = {
            [[<CMD>lua require("telescope.builtin").find_files({search_dirs = {"~/oss", "~/play", "~/learn", "~/cp"}})<CR>]],
            "Find Files Home",
        },
        g = { "<CMD>Telescope git_files<CR>", "Git Files" },
        w = { "<CMD>Telescope grep_string<CR>", "Search string under cursor" },
        r = { "<CMD>Telescope live_grep<CR>", "Search string" },
        o = { "<CMD>Telescope oldfiles<CR>", "Old files" },
    },
}, {
    prefix = "<leader>",
})

wk.register({
    g = {
        name = "git",
        s = "Stage Hunk",
        u = "Undo Stage Hunk",
        r = "Reset Hunk",
        R = "Reset Buffer",
        p = "Preview Hunk",
        b = "Blame Line",
    },
}, {
    prefix = "<leader>",
})

wk.register({
    g = {
        name = "git",
        s = "Stage Hunk",
        r = "Reset Hunk",
    },
}, {
    prefix = "<leader>",
    mode = "v",
})

wk.register({
    i = {
        name = "inside",
        h = "Git Hunk",
    },
}, { mode = "o", prefix = "" })

wk.register({
    i = {
        name = "inside",
        h = "Git Hunk",
    },
}, { mode = "x", prefix = "" })

wk.register({
    h = {
        name = "hop",
        w = { "<cmd>HopWord<cr>", "Word" },
        l = { "<cmd>HopLine<cr>", "Line" },
        c = { "<cmd>HopChar1<cr>", "Char1" },
        v = { "<cmd>HopChar2<cr>", "Char2" },
        p = { "<cmd>HopPattern<cr>", "Pattern" },
    },
}, {
    prefix = "<leader>",
})

wk.register({
    h = {
        name = "hop",
        w = { "<cmd>HopWord<cr>", "Word" },
        l = { "<cmd>HopLine<cr>", "Line" },
        c = { "<cmd>HopChar1<cr>", "Char1" },
        v = { "<cmd>HopChar2<cr>", "Char2" },
        p = { "<cmd>HopPattern<cr>", "Pattern" },
    },
}, {
    prefix = "<leader>",
    mode = "v",
})

wk.register({
    b = {
        name = "buffer",
        q = { "<CMD>bd<CR>", "Delete" },
        l = { "<CMD>BufferLineMoveNext<CR>", "Move Right" },
        h = { "<CMD>BufferLineMovePrev<CR>", "Move Left" },
        p = { "<CMD>BufferLinePick<CR>", "Pick buffer" },
        c = { "<CMD>BufferLinePickClose<CR>", "Close buffer" },
        d = { "<CMD>%d<CR>", "Delete Buffer Content" },
        y = { "<CMD>%y<CR>", "Copy Buffer Content" },
        s = {
            name = "Sort By",
            e = { "<CMD>BufferLineSortByExtension<CR>", "Extension" },
            d = { "<CMD>BufferLineSortByDirectory<CR>", "Directory" },
            r = { "<CMD>BufferLineSortByRelativeDirectory<CR>", "Relative Directory" },
        },
    },
}, {
    prefix = "<leader>",
})

wk.register({
    w = {
        name = "windows",
        w = { "<C-W>w", "other-window" },
        q = { "<C-W>c", "delete-window" },
        ["-"] = { "<C-W>s", "split-window-below" },
        ["|"] = { "<C-W>v", "split-window-right" },
        ["2"] = { "<C-W>v", "layout-double-columns" },
        h = { "<C-W>h", "window-left" },
        j = { "<C-W>j", "window-below" },
        l = { "<C-W>l", "window-right" },
        k = { "<C-W>k", "window-up" },
        H = { "<C-W>5<", "expand-window-left" },
        J = { "<CMD>resize +5<CR>", "expand-window-below" },
        L = { "<C-W>5>", "expand-window-right" },
        K = { "<CMD>resize -5<CR>", "expand-window-up" },
        ["="] = { "<C-W>=", "balance-window" },
        s = { "<C-W>s", "split-window-below" },
        v = { "<C-W>v", "split-window-below" },
    },
}, {
    prefix = "<leader>",
})

wk.register({
    o = {
        name = "cphelper",
        d = { "<CMD>CphDelete<CR>", "Delete testcases" },
        e = { "<CMD>CphEdit<CR>", "Edit/Add testcases" },
        r = { "<CMD>CphReceive<CR>", "Receive problem" },
        t = { "<CMD>CphTest<CR>", "Run tests" },
        i = { "<CMD>CphRetest<CR>", "Run tests without recompiling" },
    },
}, {
    prefix = "<leader>",
})
