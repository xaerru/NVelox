local present, nordbuddy = pcall(require, "nordbuddy")

if present and nvlx.general.colorscheme == "nordbuddy" then
    nordbuddy.colorscheme({
        italic_comments = true
    })
    require("highlights").load()
    return true
else
    return false
end
