require("indent_blankline").setup(require("_nvlx.utils").merge({
    char = "│",
    filetype_exclude = { "help", "terminal", "dashboard", "packer" },
    buftype_exclude = { "terminal" },
}, nvlx.config.plugins.indent_blankline, nvlx.config.plugins_override.indent_blankline))
