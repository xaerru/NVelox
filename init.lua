require("general")
local plugins = require("plugins")
local loader = require("loader").init()
loader:load({ plugins, loader.user_plugins })
vim.cmd([[
colorscheme nordbuddy
highlight TSNodeKey cterm=bold ctermfg=198 gui=bold guifg=#8fbcbb
highlight TSNodeUnmatched ctermfg=242 guifg=#4c566a
hi Visual gui=reverse
]])
