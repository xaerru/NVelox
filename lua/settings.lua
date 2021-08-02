local M = {}

local function set_true(value)
    vim.opt[value] = true
end

local function set(value, to)
    vim.opt[value] = to
end

local setti

set_true("hidden")
set_true("relativenumber")
set_true("ruler")
set_true("splitbelow")
set_true("splitright")
set_true("smarttab")
set_true("expandtab")
set_true("smartindent")
set_true("autoindent")
set_true("number")
set_true("autoread")
set_true("title")
set_true("linebreak")
set_true("termguicolors")
set_true("hlsearch")
set_true("list")
set_true("smartcase")
set_true("ignorecase")

set("wrap", false)
set("signcolumn", "yes")
set("showmode", false)
set("encoding", "utf-8")
set("fileencoding", "utf-8")
set("pumheight", 10)
set("pumheight", 10)
set("iskeyword", vim.opt.iskeyword + { "-" })
set("mouse", "a")
set("cmdheight", 2)
set("conceallevel", 0)
set("tabstop", 4)
set("shiftwidth", 4)
set("showtabline", 2)
set("backspace", { "indent", "eol", "start" })
set("shortmess", vim.opt.shortmess:append("c"))
set("updatetime", 300)
set("timeoutlen", 500)
set("clipboard", "unnamedplus")
set("scrolloff", 8)
set("sidescrolloff", 8)
set("inccommand", "nosplit")
set("colorcolumn", "100")
set("completeopt", "menuone,noselect")
set(
    "listchars",
    table.concat({
        "eol:↲",
        "tab:▶‒",
        "trail:•",
        "extends:❯",
        "precedes:❮",
        "nbsp:_",
    }, ",")
)
set_true("undofile")
set("undodir", "/home/grvxs/.cache/nvim/undo")
set("undolevels", 1000)
set("undoreload", 10000)
set("showbreak", "↪")

return M
