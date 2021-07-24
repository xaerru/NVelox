local wk = require("which-key")

wk.register({
  ["<leader>f"] = {"<CMD>Neoformat | write<CR>", "Format"},
  ["<leader><TAB>"] = {"<CMD>:BufferLineCyclePrev<CR>", "Previous Buffer"},
  ["]c"] = "Next Git Hunk",
  ["[c"] = "Previous Git Hunk",
})

wk.register({
  t = {
    name = "terminal",
    g = { "<CMD>FloatermNew --height=0.9 --width=0.9 --position=center lazygit<CR>", "lazygit" },
    v = { "<CMD>FloatermNew --height=40 --width=0.5 --position=right<CR>", "Vertical" },
    h = { "<CMD>FloatermNew --height=0.5 --width=0.99 --position=top<CR>", "Horizontal" },
    f = { "<CMD>FloatermNew --height=40 --width=0.99<CR>", "Full" },
  },
}, { prefix = "<leader>" })

wk.register({
  p = {
    name = "telescope",
    p = { "<CMD>Telescope<CR>", "Telescope" },
    f = { "<CMD>Telescope find_files<CR>", "Find Files" },
    h = { "<CMD>lua require('telescope.builtin').find_files({search_dirs = {'~/oss', '~/play', '~/learn', '~/cp'}})<CR>", "Find files home" },
    g = { "<CMD>Telescope git_files<CR>", "Git Files" },
    w = { "<CMD>Telescope grep_string<CR>", "Search string under cursor" },
    r = { "<CMD>Telescope live_grep<CR>", "Search string" },
    o = { "<CMD>Telescope oldfiles<CR>", "Old files" },
  },
}, { prefix = "<leader>" })

wk.register({
  g = {
    name = "git",
    s = 'Stage Hunk',
    u = 'Undo Stage Hunk',
    r = 'Reset Hunk',
    R = 'Reset Buffer',
    p = 'Preview Hunk',
    b = 'Blame Line',
  }
}, {prefix = "<leader>"})

wk.register({
  g = {
    name = "git",
    s = 'Stage Hunk',
    r = 'Reset Hunk',
  }
}, {prefix = "<leader>", mode = "v"})

wk.register({
  i = {
    name = "inside",
    h = "Git Hunk"
  },
}, {mode = "o", prefix = ""})

wk.register({
  h = {
    name = "hop",
    w = {"<cmd>HopWord<cr>", "Word"},
    l = {"<cmd>HopLine<cr>", "Line"},
    c = {"<cmd>HopChar1<cr>", "Char1"},
    v = {"<cmd>HopChar2<cr>", "Char2"},
    p = {"<cmd>HopPattern<cr>", "Pattern"},
  }
}, {prefix = "<leader>"})

wk.register({
  h = {
    name = "hop",
    w = {"<cmd>HopWord<cr>", "Word"},
    l = {"<cmd>HopLine<cr>", "Line"},
    c = {"<cmd>HopChar1<cr>", "Char1"},
    v = {"<cmd>HopChar2<cr>", "Char2"},
    p = {"<cmd>HopPattern<cr>", "Pattern"},
  }
}, {prefix = "<leader>", mode = "v"})

wk.register({
  b = {
    name = "buffer",
    d = {"<CMD>bd<CR>", "Delete"},
    d = {"<CMD>bd<CR>", "Delete"},
  }
}, {prefix = "<leader>", mode = "v"})
