local nord = require("lualine.themes.nord")

nord.insert.a.bg = "#A3BE8C"

local function git()
  local g = vim.b.gitsigns_status_dict
  if g == nil then
    return nil
  else
    return string.format("+%s ~%s -%s", g.added, g.changed, g.removed)
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
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {"filename"},
    lualine_x = {"location"},
    lualine_y = {},

    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
