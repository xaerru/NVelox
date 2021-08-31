require("nvim-autopairs").setup(require("_nvlx.utils").merge({
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
}, nvlx.config.plugins.autopairs, nvlx.config.plugins_override.autopairs))
require("nvim-autopairs.completion.compe").setup()
