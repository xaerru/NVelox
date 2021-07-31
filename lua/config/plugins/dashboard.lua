local g = vim.g

g.dashboard_disable_at_vimenter = 0
g.dashboard_disable_statusline = 0
g.dashboard_default_executive = "telescope"

g.dashboard_custom_header = {
    " ██████╗ ██████╗ ██╗   ██╗██╗  ██╗███████╗",
    "██╔════╝ ██╔══██╗██║   ██║╚██╗██╔╝██╔════╝",
    "██║  ███╗██████╔╝██║   ██║ ╚███╔╝ ███████╗",
    "██║   ██║██╔══██╗╚██╗ ██╔╝ ██╔██╗ ╚════██║",
    "╚██████╔╝██║  ██║ ╚████╔╝ ██╔╝ ██╗███████║",
    " ╚═════╝ ╚═╝  ╚═╝  ╚═══╝  ╚═╝  ╚═╝╚══════╝",
    "                                          ",
    "                                          ",
    "                                          ",
}

g.dashboard_custom_section = {
    a = { description = { "  Find File                 SPC f f" }, command = "Telescope find_files" },
    c = { description = { "  Find Word                 SPC f w" }, command = "Telescope live_grep" },
    f = { description = { "  Load Last Session         SPC s l" }, command = "SessionLoad" },
}