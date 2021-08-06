local colorscheme = nvlx.general.colorscheme

if colorscheme == "nordbuddy" then
    require("nordbuddy").colorscheme({
        italic_comments = true,
    })
else
    vim.cmd("colorscheme " .. colorscheme)
end
