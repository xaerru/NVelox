HOME = os.getenv("HOME")

-- Load utils
local utils = require("_nvlx.utils")

-- Load global nvlx
require("_nvlx.defaults")

-- Load user config
local default_package_path = package.path
local default_nvlx = utils.copy(nvlx)

package.path = string.format(
    "%s/.config/?/init.lua;%s/.config/nvlx/?.lua;%s/.config/nvlx/?/init.lua",
    HOME,
    HOME,
    HOME
)

local ok, error = pcall(require, "nvlx")
if not ok then
    print(error)
end

nvlx = vim.tbl_deep_extend("force", default_nvlx, nvlx)

package.path = default_package_path

-- Load plugins
local plugins = require("_nvlx.plugins")
local loader = require("_nvlx.loader").init()
loader:load({ plugins, nvlx.plugins })

-- Load default config
require("_nvlx.settings").load()
require("_nvlx.keybinds").load()
require("_nvlx.autocmds").load()
