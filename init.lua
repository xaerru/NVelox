-- Load utils
local utils = require("utils")

-- Load global nvlx
require("defaults")

-- Load user config
local default_package_path = package.path
local default_nvlx = utils.copy(nvlx)

package.path = os.getenv("HOME") .. "/.config/?/init.lua;" .. package.path
local ok, error = pcall(require, "nvlx")
if not ok then
    print(error)
end

nvlx = vim.tbl_deep_extend("force", default_nvlx, nvlx)

package.path = default_package_path

-- Load plugins
local plugins = require("plugins")
local loader = require("loader").init()
loader:load({ plugins, nvlx.plugins })

-- Load default config
require("settings").load()
require("keybinds").load()
require("autocmds").load()
