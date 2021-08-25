require("nvim-autopairs").setup(require("_nvlx.utils").merge({
    check_ts = true,
}, nvlx.config.plugins.autopairs, nvlx.config.plugins_override.autopairs))
require("nvim-autopairs.completion.compe").setup()
