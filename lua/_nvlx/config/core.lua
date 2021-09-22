local M = {}

M.options = {
    autoindent = true,
    autoread = true,
    backspace = { "indent", "eol", "start" },
    clipboard = "unnamedplus",
    cmdheight = 2,
    completeopt = "menuone,noselect",
    conceallevel = 0,
    encoding = "utf-8",
    expandtab = true,
    fileencoding = "utf-8",
    hidden = true,
    hlsearch = true,
    ignorecase = true,
    inccommand = "nosplit",
    lazyredraw = true,
    linebreak = true,
    mouse = "a",
    number = true,
    pumheight = 10,
    ruler = true,
    scrolloff = 8,
    shiftwidth = 4,
    shortmess = vim.opt.shortmess:append("c"),
    showmode = false,
    showtabline = 2,
    sidescrolloff = 8,
    signcolumn = "yes",
    smartcase = true,
    smartindent = true,
    smarttab = true,
    splitbelow = true,
    splitright = true,
    tabstop = 8,
    termguicolors = true,
    timeoutlen = 150,
    title = true,
    titlelen = 70,
    titlestring = " %F - NVelox",
    undodir = os.getenv("HOME") .. "/.cache/nvim/undo",
    undofile = true,
    undolevels = 1000,
    undoreload = 10000,
    updatetime = 0,
    wrap = false,
}

M.maps = {
    general = {
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
            ["<S-TAB>"] = ":BufferLineCyclePrev<CR>",
            ["<CR>"] = ":noh<CR>",
        },

        object = {},

        visual = {
            ["<"] = "<gv",
            [">"] = ">gv",
        },
    },
    leader = {
        normal = {
            t = {
                {
                    name = "telescope",
                    f = { "<CMD>Telescope find_files<CR>", "Find Files" },
                    g = { "<CMD>Telescope git_files<CR>", "Git Files" },
                    h = {
                        [[<CMD>lua require("telescope.builtin").find_files({search_dirs = {"~/oss", "~/play", "~/learn", "~/cp"}})<CR>]],
                        "Find Files Home",
                    },
                    o = { "<CMD>Telescope oldfiles<CR>", "Old files" },
                    t = { "<CMD>Telescope<CR>", "Telescope" },
                    r = { "<CMD>Telescope live_grep<CR>", "Search string" },
                    w = { "<CMD>Telescope grep_string<CR>", "Search string under cursor" },
                },
            },

            g = {
                {
                    name = "git",
                    l = { "<CMD>lua require('_nvlx.terminal').lazygit()<CR>", "lazygit" },
                    R = "Reset Buffer",
                    b = "Blame Line",
                    p = "Preview Hunk",
                    r = "Reset Hunk",
                    s = "Stage Hunk",
                    u = "Undo Stage Hunk",
                },
            },

            b = {
                {
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
            },

            w = {
                {
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
            },

            s = {
                {
                    name = "session",
                    a = { "<CMD>:lua require('_nvlx.sessions').sload()<CR>", "Session Finder" },
                    c = {
                        "<CMD>:lua require('persistence').load_current()<CR>",
                        "Restore Current Directory Session",
                    },
                    l = { "<CMD>:lua require('persistence').load_last()<CR>", "Load Last Session" },
                },
            },

            c = {
                {
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
            },

            r = {
                {
                    name = "run",
                    f = { "<CMD>lua require('_nvlx.terminal').run_file()<CR>", "File" },
                    r = { "<CMD>lua require('_nvlx.terminal').run_repl()<CR>", "REPL" },
                    p = {
                        "<CMD>lua require('_nvlx.terminal').run_project()<CR>",
                        "Project",
                    },
                },
            },
        },
        visual = {
            g = {
                {
                    name = "git",
                    r = "Reset Hunk",
                    s = "Stage Hunk",
                },
            },
            c = {
                {
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
            },
        },
        object = {
            i = {
                {
                    name = "inside",
                    h = "Git Hunk",
                },
                { mode = "o", prefix = "" },
            },
        },
        visual_block = {
            i = {
                {
                    name = "inside",
                    h = "Git Hunk",
                },
                { mode = "x", prefix = "" },
            },
        },
        {
            ["<leader><TAB>"] = { "<CMD>:BufferLineCyclePrev<CR>", "Previous Buffer" },
            ["<leader>n"] = { "<CMD>NvimTreeToggle<CR>", "Nvim Tree Toggle" },
            ["[c"] = "Previous Git Hunk",
            ["]c"] = "Next Git Hunk",
        },
    },
}

return M
