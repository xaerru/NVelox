local M = {}

local cmd = vim.cmd

local autocmds = {
    __general = {
        {
            "BufWinEnter",
            "*",
            ":set formatoptions-=cro",
        },
        {
            "TextYankPost",
            "*",
            "silent! lua require'vim.highlight'.on_yank({timeout = 200})",
        },
        {
            "VimResized",
            "*",
            "wincmd =",
        },
    },
    __terminal = {
        {
            "TermEnter",
            "*",
            "silent! wa!",
        },
    },
}

function M.load()
    for name, def in pairs(autocmds) do
        cmd("augroup " .. name)
        cmd("autocmd!")
        for _, autocmd in pairs(def) do
            local command = table.concat(vim.tbl_flatten({ "autocmd", autocmd }), " ")
            cmd(command)
        end
        for _, autocmd in pairs(nvlx.autocmds) do
            local command = table.concat(vim.tbl_flatten({ "autocmd", autocmd }), " ")
            cmd(command)
        end
        cmd("augroup END")
    end
end

return M
