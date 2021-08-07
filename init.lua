-- Load global nvlx
require("defaults")

-- Load user config
local default_package_path = package.path
package.path = package.path .. ";" .. os.getenv("HOME") .. "/.config/?/init.lua"
package.path = package.path .. ";" .. os.getenv("HOME") .. "/.config/nvlx/?/init.lua"
package.path = package.path .. ";" .. os.getenv("HOME") .. "/.config/nvlx/?.lua"
require("nvlx")
package.path = default_package_path

-- Load plugins
local plugins = require("plugins")
local loader = require("loader").init()
loader:load({ plugins, nvlx.plugins })

-- Load default config
require("settings").load()
require("keybinds").load()
require("autocmds").load()
require("colors")
require("highlights").load()
