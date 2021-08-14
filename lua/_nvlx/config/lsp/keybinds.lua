vim.cmd("nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>")
vim.cmd("nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>")
vim.cmd("nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>")
vim.cmd("nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>")
vim.api.nvim_set_keymap(
    "n",
    "gl",
    '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ show_header = false, border = "none" })<CR>',
    { noremap = true, silent = true }
)

vim.cmd("nnoremap <silent> gp <cmd>lua require'_nvlx.config.lsp.service'.PeekDefinition()<CR>")
vim.cmd("nnoremap <silent> K :lua vim.lsp.buf.hover()<CR>")
vim.cmd(
    "nnoremap <silent> <C-p> :lua vim.lsp.diagnostic.goto_prev({popup_opts = {border = 'none'}})<CR>"
)
vim.cmd(
    "nnoremap <silent> <C-n> :lua vim.lsp.diagnostic.goto_next({popup_opts = {border = 'none'}})<CR>"
)
vim.cmd("nnoremap <silent> gs <cmd>lua vim.lsp.buf.signature_help()<CR>")
-- scroll down hover doc or scroll in definition preview
-- scroll up hover doc
vim.cmd('command! -nargs=0 LspVirtualTextToggle lua require("lsp/virtual_text").toggle()')
