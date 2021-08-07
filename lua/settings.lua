local M = {}

local default_settings = {
    hidden = true,
    relativenumber = true,
    ruler = true,
    splitbelow = true,
    splitright = true,
    smarttab = true,
    expandtab = true,
    smartindent = true,
    autoindent = true,
    number = true,
    autoread = true,
    title = true,
    linebreak = true,
    termguicolors = true,
    hlsearch = true,
    list = true,
    smartcase = true,
    ignorecase = true,
    wrap = false,
    undofile = true,
    signcolumn = "yes",
    showmode = false,
    encoding = "utf-8",
    fileencoding = "utf-8",
    pumheight = 10,
    iskeyword = vim.opt.iskeyword + { "-" },
    mouse = "a",
    cmdheight = 2,
    conceallevel = 0,
    tabstop = 4,
    shiftwidth = 4,
    showtabline = 2,
    backspace = { "indent", "eol", "start" },
    shortmess = vim.opt.shortmess:append("c"),
    updatetime = 300,
    timeoutlen = 100,
    clipboard = "unnamedplus",
    scrolloff = 8,
    sidescrolloff = 8,
    inccommand = "nosplit",
    colorcolumn = "100",
    completeopt = "menuone,noselect",
    undodir = "/home/grvxs/.cache/nvim/undo",
    undolevels = 1000,
    undoreload = 10000,
    showbreak = "↪",
    listchars = table.concat({
        "eol:↲",
        "tab:▶‒",
        "trail:•",
        "extends:❯",
        "precedes:❮",
        "nbsp:_",
    }, ","),
}

function M.load_settings(settings)
    for option, value in pairs(settings) do
        vim.opt[option] = value
    end
end

function M.load()
    M.load_settings(default_settings)
    M.load_settings(nvlx.settings)
end

return M
