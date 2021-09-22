local core = require("_nvlx.config.core")

local nvlx = {
    general = {
        leader = " ",
        autosave = false,
        colorscheme = "nordbuddy",
        transparent = false,
        highlights = {},
        winblend = 0,
    },
    disabled = {
        builtin_plugins = {},
        plugins = {},
    },
    options = core.options,
    keybinds = {
        general = {
            command = {},
            insert = {},
            normal = {},
            object = {},
            terminal = {},
            visual = {},
            visual_block = {},
        },
        leader = {},
    },
    autocmds = {},
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
