local colorscheme = sky.general.colorscheme

if colorscheme == "nordbuddy" then
    require("nordbuddy").colorscheme({
        -- Italic styled comments
        italic_comments = true,
    })
    vim.cmd([[
highlight TSNodeKey cterm=bold ctermfg=198 gui=bold guifg=#8fbcbb
highlight TSNodeUnmatched ctermfg=242 guifg=#4c566a
highlight Visual gui=reverse
highlight Whitespace guibg=#2E3440
]])
else
    vim.cmd("colorscheme " .. colorscheme)
end
