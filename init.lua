local function set(value, to)
    to = to or true
    vim.opt[value] = to
end

set "hidden"
set "relativenumber"
set "ruler"
set "splitbelow"
set "splitright"
set "smarttab"
set "expandtab"
set "smartindent"
set "autoindent"
set "number"
set "autoread"
set "title"
set "linebreak"
set "termguicolors"
set "hlsearch"

set("wrap", false)
set("showmode", false)
set("encoding", "utf-8")
set("fileencoding", "utf-8")
set("pumheight", 10)
set("pumheight", 10)
set("iskeyword", vim.opt.iskeyword + {"-"})
set("mouse", "a")
set("cmdheight", 2)
set("conceallevel", 0)
set("tabstop", 4)
set("shiftwidth", 4)
set("showtabline", 2)
set("backspace", {"indent", "eol", "start"})
set("updatetime", 300)
set("timeoutlen", 500)
set("formatoptions", vim.opt.formatoptions - {"cro"})
set("clipboard", "unnamedplus")
set("scrolloff", 5)
set("inccommand", "nosplit")
set("list")
