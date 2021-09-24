local core = require("_nvlx.config.core")

local nvlx = {
    general = {
        leader = " ",
        autosave = false,
        colorscheme = "nordbuddy",
        transparent = false,
        winblend = 0,
    },
    disabled = {
        builtin_plugins = {},
        plugins = {},
    },
    autocmds = core.autocmds,
    highlights = core.highlights,
    maps = core.maps,
    options = core.options,
    plugins = {},
    config = {
        plugins = {
            autopairs = {},
            autosave = {},
            bufferline = {},
            colorizer = {},
            compe = {},
            feline = {},
            gitsigns = {},
            indent_blankline = {},
            persistence = {},
            telescope = {},
            toggleterm = {},
            treesitter = {},
            whichkey = {},
        },
        plugins_override = {
            autopairs = {},
            autosave = {},
            bufferline = {},
            colorizer = {},
            compe = {},
            feline = {},
            gitsigns = {},
            indent_blankline = {},
            persistence = {},
            telescope = {},
            toggleterm = {},
            treesitter = {},
            whichkey = {},
        },
    },
}
return nvlx
