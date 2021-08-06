local M = {}

local highlights = {
    TSNodeKey = {
        cterm = "bold",
        ctermfg = 198,
        gui = "bold",
        guifg = "#8fbcbb",
    },
    TSNodeUnmatched = {
        ctermfg = 242,
        guifg = "#4c566a"
    },
    Visual = {
        gui = "reverse"
    },
}

function M.load()
    for group, highlight in pairs(highlights) do
        local cmd = string.format("highlight %s ", group)
        for key, value in pairs(highlight) do
            cmd = cmd .. string.format("%s=%s ", key, value)
        end
        vim.cmd(cmd:sub(1,-2))
    end
end

return M
