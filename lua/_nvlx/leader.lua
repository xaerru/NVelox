local M = {}

local wk = require("which-key")

function M.register(binds, opts)
    for key, bind in pairs(binds) do
        wk.register({ [key] = bind[1] }, bind[2] or opts)
    end
end

-- TODO refactor this
function M.loader(keybinds)
    for mode, binds in pairs(keybinds) do
        if mode == "normal" then
            local opts = { prefix = "<leader>" }
            M.register(binds, opts)
        elseif mode == "visual" then
            local opts = { prefix = "<leader>", mode = "v" }
            M.register(binds, opts)
        elseif mode == "visual_block" then
            local opts = { prefix = "<leader>", mode = "x" }
            M.register(binds, opts)
        elseif mode == "insert" then
            local opts = { prefix = "<leader>", mode = "i" }
            M.register(binds, opts)
        elseif mode == "object" then
            local opts = { prefix = "<leader>", mode = "o" }
            M.register(binds, opts)
        else
            local opts = {}
            wk.register(binds, opts)
        end
    end
end

function M.load(leader)
    M.loader(leader)
end

return M
