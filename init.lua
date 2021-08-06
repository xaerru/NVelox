require("defaults")
local nvlx_config_file = os.getenv("HOME") .. "/.config/nvlx/config.lua"
local ok, error = pcall(vim.cmd, "luafile" .. nvlx_config_file)
if not ok then
    print("Please check your " .. nvlx_config_file .. " for correction.")
    print(error)
end
require("settings").load()
require("keybinds").load()
local plugins = require("plugins")
local loader = require("loader").init()
loader:load({ plugins, loader.user_plugins })
loader:load({ plugins, nvlx.plugins })
require("autocmds").load()
require("colors")
require("highlights").load()
