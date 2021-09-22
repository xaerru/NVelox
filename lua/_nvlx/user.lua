local M = {}

function M:init()
    HOME = os.getenv("HOME")

    -- Load defaults nvlx
    local defaults = require("_nvlx.defaults")

    -- Load user config
    local default_package_path = package.path
    package.path = string.format("%s/.config/?/init.lua", HOME, HOME, HOME)
    local nvlx = require("nvlx")

    -- Merge default and user config
    nvlx = vim.tbl_deep_extend("force", defaults, nvlx)
    package.path = default_package_path
    self.nvlx = nvlx
    return self
end

function M:get_nvlx()
    return self.nvlx
end

return M
