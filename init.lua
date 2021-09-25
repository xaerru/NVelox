require("_nvlx.user"):init()
local nvlx = require("_nvlx.user"):get_nvlx()

-- Set leader
vim.g.mapleader = nvlx.general.leader

-- Load plugins
require("_nvlx.loader").load({ require("_nvlx.plugins"), nvlx.plugins }, nvlx.disabled.plugins)

-- Load default options, kebinds, autocmds
require("_nvlx.build.init")
-- require("_nvlx.options").load(nvlx.options)
require("_nvlx.maps").load(nvlx.maps.general)
require("_nvlx.autocmds").load(nvlx.autocmds)
