-- Stop comments on newline
vim.cmd([[autocmd BufWinEnter * :set formatoptions-=cro]])

-- Auto remove trailing space
vim.cmd([[autocmd BufWritePre * %s/\s\+$//e]])

-- Write all the buffers before opening and closing the terminal
vim.cmd([[autocmd TermEnter * :silent! wa!]])
vim.cmd([[autocmd TermLeave * :silent! e!]])

-- Highlight yank
vim.cmd([[
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END]])
