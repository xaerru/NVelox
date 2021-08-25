require("persistence").setup(require("_nvlx.utils").merge({
    dir = vim.fn.expand(vim.fn.stdpath("data") .. "/sessions/"),
}, nvlx.config.plugins.persistence, nvlx.config.plugins_override.persistence))
