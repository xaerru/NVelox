local M = {}

local function set_true(value, to)
  vim.opt[value] = true
end

local function set(value, to)
  vim.opt[value] = to
end

set_true "hidden"
set_true "relativenumber"
set_true "ruler"
set_true "splitbelow"
set_true "splitright"
set_true "smarttab"
set_true "expandtab"
set_true "smartindent"
set_true "autoindent"
set_true "number"
set_true "autoread"
set_true "title"
set_true "linebreak"
set_true "termguicolors"
set_true "hlsearch"

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

return M
