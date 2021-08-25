local M = {}

function M.copy(obj, seen)
    if type(obj) ~= "table" then
        return obj
    end
    if seen and seen[obj] then
        return seen[obj]
    end
    local s = seen or {}
    local res = setmetatable({}, getmetatable(obj))
    s[obj] = res
    for k, v in pairs(obj) do
        res[M.copy(k, s)] = M.copy(v, s)
    end
    return res
end

function M.tbl_add(t1, t2)
    for i = 1, #t2 do
        t1[#t1 + 1] = t2[i]
    end
    return t1
end

function M.hot_reload()
    package.loaded["plugins"] = nil
    package.loaded["settings"] = nil
    package.loaded["highlights"] = nil
    package.loaded["keybinds"] = nil
    package.loaded["nvlx"] = nil
    vim.cmd([[
        source ~/.config/nvim/lua/plugins.lua
        source ~/.config/nvim/lua/settings.lua
        source ~/.config/nvim/lua/highlights.lua
        source ~/.config/nvim/lua/keybinds.lua
        source ~/.config/nvlx/init.lua
    ]])
    require("_nvlx.settings").load()
    require("_nvlx.highlights").load()
    require("_nvlx.keybinds").load()
    local plugins = require("_nvlx.plugins")
    local loader = require("_nvlx.loader").init()
    loader:load({ plugins, nvlx.plugins })
    vim.cmd(":PackerCompile")
    vim.cmd(":PackerInstall")
end

function M.merge(default, user, override)
    override = override or {}
    if vim.tbl_isempty(override) then
        local config = vim.tbl_deep_extend("force", default, user)
        return config
    else
        return override
    end
end

return M
