return {
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
