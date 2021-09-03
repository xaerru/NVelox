local M = {}

local default_settings = {
    autoindent = true,
    autoread = true,
    backspace = { "indent", "eol", "start" },
    clipboard = "unnamedplus",
    cmdheight = 2,
    completeopt = "menuone,noselect",
    conceallevel = 0,
    encoding = "utf-8",
    expandtab = true,
    fileencoding = "utf-8",
    hidden = true,
    hlsearch = true,
    ignorecase = true,
    inccommand = "nosplit",
    iskeyword = vim.opt.iskeyword + { "-" },
    lazyredraw = true,
    linebreak = true,
    mouse = "a",
    number = true,
    pumheight = 10,
    ruler = true,
    scrolloff = 8,
    shiftwidth = 4,
    shortmess = vim.opt.shortmess:append("c"),
    showmode = false,
    showtabline = 2,
    sidescrolloff = 8,
    signcolumn = "yes",
    smartcase = true,
    smartindent = true,
    smarttab = true,
    splitbelow = true,
    splitright = true,
    tabstop = 8,
    termguicolors = true,
    timeoutlen = 150,
    title = true,
    undodir = os.getenv("HOME") .. "/.cache/nvim/undo",
    undofile = true,
    undolevels = 1000,
    undoreload = 10000,
    updatetime = 300,
    wrap = false,
}

function M.define(settings)
    for option, value in pairs(settings) do
        vim.opt[option] = value
    end
end

function M.load()
    for _, plugin in pairs(nvlx.disabled.builtin_plugins) do
        vim.g["loaded_" .. plugin] = 1
    end
    M.define(default_settings)
    M.define(nvlx.settings)
end

return M
