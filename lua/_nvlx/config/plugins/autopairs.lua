require("nvim-autopairs").setup(require("_nvlx.utils").merge({
    check_ts = true,
}, nvlx.config.plugins.autopairs))
require("nvim-autopairs.completion.compe").setup()
