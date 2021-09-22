local M = {}

function M.define(settings)
    for option, value in pairs(settings) do
        vim.opt[option] = value
    end
end

function M.load(options)
    --for _, plugin in pairs(nvlx.disabled.builtin_plugins) do
    --vim.g["loaded_" .. plugin] = 1
    --end
    M.define(options)
end

return M
