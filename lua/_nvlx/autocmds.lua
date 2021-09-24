local M = {}

local cmd = vim.cmd

function M.define(autocmds)
    for name, def in pairs(autocmds) do
        cmd("augroup " .. name)
        cmd("autocmd!")
        for _, autocmd in pairs(def) do
            local command = table.concat(vim.tbl_flatten({ "autocmd", autocmd }), " ")
            cmd(command)
        end
        cmd("augroup END")
    end
end

function M.load(autocmds)
    M.define(autocmds)
end

return M
