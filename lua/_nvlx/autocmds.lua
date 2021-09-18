local M = {}

local cmd = vim.cmd

local default_autocmds = {
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
    __dashboard = {
        {
            "FileType",
            "dashboard",
            [[setlocal fillchars=fold:\ ,vert:\│,eob:\ ,msgsep:‾]],
        },

        {
            "FileType",
            "dashboard",
            [[nnoremap <silent> <buffer> q :q<CR>]],
        },
    },
}

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

function M.load()
    M.define(default_autocmds)
    M.define(nvlx.autocmds)
end

return M
