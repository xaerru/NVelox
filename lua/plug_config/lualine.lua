local nord = require("lualine.themes.nord")

nord.insert.a.bg = "#A3BE8C"
nord.normal.b.bg = "#81A1C1"
nord.normal.b.fg = "#3B4252"

local function git()
  local g = vim.b.gitsigns_status_dict
  if g == nil then
    return nil
  else
    return string.format("+%s ~%s -%s  %s", g.added, g.changed, g.removed, g.head)
  end
end

require"lualine".setup {
  options = {
    icons_enabled = true,
    theme = nord,
  },
  sections = {
    lualine_a = {"mode"},
    lualine_b = {git},
    lualine_c = {"filename"},
    lualine_x = {"filetype"},
    lualine_y = {},
    lualine_z = {"location"}
  },
  tabline = {},
  extensions = {}
}
