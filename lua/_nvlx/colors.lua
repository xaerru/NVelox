local present, nordbuddy = pcall(require, "nordbuddy")

if present and nvlx.general.colorscheme == "nordbuddy" then
    local cmd = vim.cmd
    vim.cmd("colorscheme nordbuddy")
    nordbuddy.colorscheme({
        italic_comments = true,
    })
    require("_nvlx.highlights").load()
    if nvlx.general.transparent then
        cmd("hi Normal ctermbg=none guibg=none")
        cmd("hi SignColumn ctermbg=none guibg=none")
        cmd("hi NormalNC ctermbg=none guibg=none")
        cmd("hi MsgArea ctermbg=none guibg=none")
        cmd("hi TelescopeBorder ctermbg=none guibg=none")
        cmd("hi NvimTreeNormal ctermbg=none guibg=none")
        cmd("let &fcs='eob: '")
    end
    return true
else
    return false
end
