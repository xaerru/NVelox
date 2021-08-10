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
    require("settings").load()
    require("highlights").load()
    require("keybinds").load()
    local plugins = require("plugins")
    local loader = require("loader").init()
    loader:load({ plugins, nvlx.plugins })
    vim.cmd(":PackerCompile")
    vim.cmd(":PackerInstall")
end

return M
