HOME = os.getenv("HOME")

-- Load defaults nvlx
local defaults = require("_nvlx.defaults")

-- Load user config
local default_package_path = package.path
package.path = string.format("%s/.config/?/init.lua", HOME, HOME, HOME)
local nvlx = require("nvlx")

-- Merge default and user config
nvlx = vim.tbl_deep_extend("force", nvlx, defaults)
package.path = default_package_path

-- Set leader
vim.g.mapleader = nvlx.general.leader

-- Load plugins
require("_nvlx.loader").load({ require("_nvlx.plugins"), nvlx.plugins }, nvlx.disabled.plugins)
print(vim.inspect(nvlx.maps))

-- Load default options, kebinds, autocmds
require("_nvlx.options").load(nvlx.options)
require("_nvlx.keybinds").load(nvlx.maps.general)
require("_nvlx.leader").load(nvlx.maps.leader)
require("_nvlx.autocmds").load()
