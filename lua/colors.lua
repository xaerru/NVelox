local colorscheme = nvlx.general.colorscheme

if colorscheme == "nordbuddy" then
    require("nordbuddy").colorscheme({
        italic_comments = true,
    })
    vim.cmd([[
highlight TSNodeKey cterm=bold ctermfg=198 gui=bold guifg=#8fbcbb
highlight TSNodeUnmatched ctermfg=242 guifg=#4c566a
highlight Visual gui=reverse
]])
else
    vim.cmd("colorscheme " .. colorscheme)
end
