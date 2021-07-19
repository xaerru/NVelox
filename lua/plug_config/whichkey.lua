local wk = require("which-key")

wk.register({
  t = {
    name = "test",
    f = { "<cmd>echo 'hello'<CR>", "Find File" },
  },
}, { prefix = "<leader>" })
