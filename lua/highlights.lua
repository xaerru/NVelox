local M = {}

local default_highlights = {
    Visual = {
        gui = "reverse",
    },
}

function M.load_default(highlights)
    for group, highlight in pairs(highlights) do
        local cmd = string.format("highlight %s ", group)
        for key, value in pairs(highlight) do
            cmd = cmd .. string.format("%s=%s ", key, value)
        end
        vim.cmd(cmd:sub(1, -2))
    end
end

function M.load()
    M.load_default(default_highlights)
    M.load_default(nvlx.general.highlights)
end

return M
