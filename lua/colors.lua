vim.g.colors_name = "nordbuddy"
require("nordbuddy").colorscheme({
    -- Italic styled comments
    italic_comments = true,
})
vim.cmd([[
highlight TSNodeKey cterm=bold ctermfg=198 gui=bold guifg=#8fbcbb
highlight TSNodeUnmatched ctermfg=242 guifg=#4c566a
highlight Visual gui=reverse
]])
