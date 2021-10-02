print(vim.inspect(package.path))
return {
    maps = require("maps"),
    options = require("options"),
    autocmds = require("autocmds"),
    highlights = require("highlights"),
}
