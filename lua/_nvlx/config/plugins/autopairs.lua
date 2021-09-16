require("nvim-autopairs").setup({
    check_ts = true,
    fast_wrap = {
        map = "<C-f>",
        chars = { "{", "[", "(", '"', "'" },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
        hightlight = "Search",
    },
})
require("nvim-autopairs.completion.compe").setup()
