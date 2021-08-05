CONFIG_PATH = os.getenv("HOME") .. "/.local/share/lunarvim/lvim"
DATA_PATH = vim.fn.stdpath("data")
CACHE_PATH = vim.fn.stdpath("cache")
TERMINAL = vim.fn.expand("$TERMINAL")
USER = vim.fn.expand("$USER")

return {
    lua = {
        cmd = {
            DATA_PATH .. "/lspinstall/lua/sumneko-lua-language-server",
            "-E",
            DATA_PATH .. "/lspinstall/lua/main.lua",
        },
        settings = {
            Lua = {
                runtime = {
                    version = "LuaJIT",
                    path = vim.split(package.path, ";"),
                },
                diagnostics = {
                    globals = {
                        "vim",
                        "nvlx",
                    },
                },
                workspace = {
                    library = {
                        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                        [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                    },
                    maxPreload = 100000,
                    preloadFileSize = 1000,
                },
            },
        },
    },
}
