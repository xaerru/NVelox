local wk = require("which-key")

wk.register({
  t = {
    name = "terminal",
    g = { "<CMD>FloatermNew --height=0.9 --width=0.9 --position=center lazygit<CR>", "lazygit" },
    v = { "<CMD>FloatermNew --height=0.5 --width=0.5 --wintype=vsplit<CR>", "Vertical" },
    h = { "<CMD>FloatermNew --height=0.5 --width=0.5 --wintype=split<CR>", "Horizontal" },
    f = { "<CMD>FloatermNew --height=40 --width=0.99<CR>", "Full" },
  },
}, { prefix = "<leader>" })
