local nord = require("lualine.themes.nord")

nord.insert.a.bg = "#A3BE8C"
nord.normal.b.bg = "#81A1C1"
nord.normal.b.fg = "#3B4252"

local function git()
    local g = vim.b.gitsigns_status_dict
    if g == nil then
        return nil
    else
        return string.format("+%s ~%s -%s  %s", g.added, g.changed, g.removed, g.head)
    end
end

require("lualine").setup({
    options = {
        icons_enabled = true,
        theme = nord,
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { git },
        lualine_c = { "filename" },
        lualine_x = { "filetype" },
        lualine_y = {
            {
                "diagnostics",
                sources = { "nvim_lsp" },
                --color_error = "#BF616A",
                --color_warn = "#EBCB8B",
                --color_info = "#88C0D0",
                --color_hint = "#3A4151",
                color_error = "#3A4151",
                color_warn = "#3A4151",
                color_info = "#3A4151",
                color_hint = "#3A4151",
            },
        },
        lualine_z = { "location" },
    },
    tabline = {},
    extensions = { "nvim-tree" },
})
