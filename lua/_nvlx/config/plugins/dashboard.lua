local g = vim.g

g.dashboard_disable_at_vimenter = 0
g.dashboard_disable_statusline = 0
g.dashboard_default_executive = "telescope"

g.dashboard_custom_header = {
    [[    _   ___    __     __          ]],
    [[   / | / / |  / /__  / /___  _  __]],
    [[  /  |/ /| | / / _ \/ / __ \| |/_/]],
    [[ / /|  / | |/ /  __/ / /_/ />  <  ]],
    [[/_/ |_/  |___/\___/_/\____/_/|_|  ]],
    [[                                  ]],
}

g.dashboard_custom_section = {
    a = {
        description = { "  Sessions                             " },
        command = "lua require('_nvlx.sessions').sload()",
    },
    b = {
        description = { "  Restore Session for current directory" },
        command = "lua require('persistence').load_current()",
    },
    c = {
        description = { "  Config                               " },
        command = ":e ~/.config/nvlx/init.lua",
    },
    d = {
        description = { "  Find Files                           " },
        command = "Telescope find_files",
    },
}

require("_nvlx.autocmds").define({
    __dashboard = {
        {
            "FileType",
            "dashboard",
            [[setlocal fillchars=fold:\ ,vert:\│,eob:\ ,msgsep:‾]],
        },

        {
            "FileType",
            "dashboard",
            [[nnoremap <silent> <buffer> q :q<CR>]],
        },
    },
})

g.dashboard_custom_footer = {}
