require("which-key").setup({
    plugins = {
        presets = {
            nav = false,
        },
    },
})

local wk = require("which-key")

wk.register({
    [";;"] = { "which_key_ignore", mode = "i" },
    ["<leader><TAB>"] = { "<CMD>:BufferLineCyclePrev<CR>", "Previous Buffer" },
    ["<leader>f"] = { [[<CMD>%s/\s\+$//e | noh | Neoformat | write<CR>]], "Format" },
    ["<leader>j"] = "Move Line Down",
    ["<leader>k"] = "Move Line Up",
    ["<leader>n"] = { "<CMD>NvimTreeToggle<CR>", "Nvim Tree Toggle" },
    ["[c"] = "Previous Git Hunk",
    ["]c"] = "Next Git Hunk",
})

wk.register({
    t = {
        name = "terminal",
        g = { "<CMD>lua require('config.plugins.terminal').lazygit()<CR>", "lazygit" },
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
        f = { "<CMD>Telescope find_files<CR>", "Find Files" },
        g = { "<CMD>Telescope git_files<CR>", "Git Files" },
        h = {
            [[<CMD>lua require("telescope.builtin").find_files({search_dirs = {"~/oss", "~/play", "~/learn", "~/cp"}})<CR>]],
            "Find Files Home",
        },
        o = { "<CMD>Telescope oldfiles<CR>", "Old files" },
        p = { "<CMD>Telescope<CR>", "Telescope" },
        r = { "<CMD>Telescope live_grep<CR>", "Search string" },
        w = { "<CMD>Telescope grep_string<CR>", "Search string under cursor" },
    },
}, {
    prefix = "<leader>",
})

wk.register({
    g = {
        name = "git",
        R = "Reset Buffer",
        b = "Blame Line",
        p = "Preview Hunk",
        r = "Reset Hunk",
        s = "Stage Hunk",
        u = "Undo Stage Hunk",
    },
}, {
    prefix = "<leader>",
})

wk.register({
    g = {
        name = "git",
        r = "Reset Hunk",
        s = "Stage Hunk",
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
}, {
    mode = "o",
    prefix = "",
})

wk.register({
    i = {
        name = "inside",
        h = "Git Hunk",
    },
}, {
    mode = "x",
    prefix = "",
})

wk.register({
    H = {
        name = "hop",
        c = { "<cmd>HopChar1<cr>", "Char1" },
        l = { "<cmd>HopLine<cr>", "Line" },
        p = { "<cmd>HopPattern<cr>", "Pattern" },
        s = { "<cmd>ISwapWith<cr>", "Swap arguments" },
        v = { "<cmd>HopChar2<cr>", "Char2" },
        w = { "<cmd>HopWord<cr>", "Word" },
    },
})

wk.register({
    H = {
        name = "hop",
        c = { "<cmd>HopChar1<cr>", "Char1" },
        l = { "<cmd>HopLine<cr>", "Line" },
        p = { "<cmd>HopPattern<cr>", "Pattern" },
        v = { "<cmd>HopChar2<cr>", "Char2" },
        w = { "<cmd>HopWord<cr>", "Word" },
    },
}, {
    mode = "v",
})

wk.register({
    b = {
        name = "buffer",
        c = { "<CMD>BufferLinePickClose<CR>", "Close buffer" },
        d = { "<CMD>silent %d<CR>", "Delete Buffer Content", silent = true },
        h = { "<CMD>BufferLineMovePrev<CR>", "Move Left" },
        l = { "<CMD>BufferLineMoveNext<CR>", "Move Right" },
        p = { "<CMD>BufferLinePick<CR>", "Pick buffer" },
        q = { "<CMD>bd<CR>", "Delete" },
        s = {
            name = "Sort By",
            d = { "<CMD>BufferLineSortByDirectory<CR>", "Directory" },
            e = { "<CMD>BufferLineSortByExtension<CR>", "Extension" },
            r = { "<CMD>BufferLineSortByRelativeDirectory<CR>", "Relative Directory" },
        },
        y = { "<CMD>silent %y<CR>", "Copy Buffer Content" },
    },
}, {
    prefix = "<leader>",
})

wk.register({
    w = {
        name = "windows",
        H = { "<C-W>5>", "expand-window-right" },
        J = { "<CMD>resize -5<CR>", "expand-window-up" },
        K = { "<CMD>resize +5<CR>", "expand-window-below" },
        L = { "<C-W>5<", "expand-window-left" },
        ["-"] = { "<C-W>s", "split-window-below" },
        ["2"] = { "<C-W>v", "layout-double-columns" },
        ["="] = { "<C-W>=", "balance-window" },
        ["|"] = { "<C-W>v", "split-window-right" },
        h = { "<C-W>h", "window-left" },
        j = { "<C-W>j", "window-below" },
        k = { "<C-W>k", "window-up" },
        l = { "<C-W>l", "window-right" },
        q = { "<C-W>c", "delete-window" },
        s = { "<C-W>s", "split-window-below" },
        v = { "<C-W>v", "split-window-below" },
        w = { "<C-W>w", "other-window" },
    },
}, {
    prefix = "<leader>",
})

wk.register({
    o = {
        name = "cphelper",
        d = { "<CMD>CphDelete<CR>", "Delete testcases" },
        e = { "<CMD>CphEdit<CR>", "Edit/Add testcases" },
        i = { "<CMD>CphRetest<CR>", "Run tests without recompiling" },
        r = { "<CMD>CphReceive<CR>", "Receive problem" },
        t = { "<CMD>CphTest<CR>", "Run tests" },
    },
}, {
    prefix = "<leader>",
})

wk.register({
    s = {
        name = "session",
        a = { "<CMD>:lua require('sessions').sload()<CR>", "Session Finder" },
        c = {
            "<CMD>:lua require('persistence').load_current()<CR>",
            "Restore Current Directory Session",
        },
        l = { "<CMD>:lua require('persistence').load_last()<CR>", "Load Last Session" },
    },
}, {
    prefix = "<leader>",
})

wk.register({
    c = {
        name = "commenter",
        A = "Append",
        [" "] = "Toggle",
        ["$"] = "To EOL",
        a = "Alt Delims",
        b = "Align Both",
        c = "Comment",
        i = "Invert",
        l = "Alight Left",
        m = "Minimal",
        n = "Nested",
        s = "Sexy",
        u = "Uncomment",
        y = "Yank",
    },
}, {
    prefix = "<leader>",
})

wk.register({
    r = {
        name = "run",
        f = { "<CMD>lua require('config.plugins.terminal').run_file()<CR>", "File" },
        r = { "<CMD>lua require('config.plugins.terminal').run_repl()<CR>", "File" },
        p = { "<CMD>lua require('config.plugins.terminal').run_project()<CR>", "Project" },
    },
}, {
    prefix = "<leader>",
})
