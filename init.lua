HOME = os.getenv("HOME")

-- Load utils
local utils = require("_nvlx.utils")

-- Load global nvlx
local nvlx = require("_nvlx.defaults")

-- Load user config
local default_package_path = package.path
local default_nvlx = utils.copy(nvlx)

package.path = string.format(
    "%s/.config/?/init.lua",
    HOME,
    HOME,
    HOME
)

local nvlx = require("nvlx")

nvlx = vim.tbl_deep_extend("force", default_nvlx, nvlx)

package.path = default_package_path

-- Load plugins
require("_nvlx.loader").load({ require("_nvlx.plugins"), nvlx.plugins })

-- Load default options, kebinds, autocmds
require("_nvlx.settings").load()
require("_nvlx.keybinds").load()
require("_nvlx.autocmds").load()
