require("lsp.signs")
require("lsp.keybinds")
require("lsp.service")
require("lsp.handlers").setup()

CONFIG_PATH = os.getenv("HOME") .. "/.local/share/lunarvim/lvim"
DATA_PATH = vim.fn.stdpath("data")
CACHE_PATH = vim.fn.stdpath("cache")
TERMINAL = vim.fn.expand("$TERMINAL")
USER = vim.fn.expand("$USER")

local function setup_servers()
    require("lspinstall").setup()
    local servers = require("lspinstall").installed_servers()
    for _, server in pairs(servers) do
        if server == "lua" then
            require("lspconfig")[server].setup({
                cmd = {
                    DATA_PATH .. "/lspinstall/lua/sumneko-lua-language-server",
                    "-E",
                    DATA_PATH .. "/lspinstall/lua/main.lua",
                },
                capabilities = common_capabilities,
                on_attach = common_on_attach,
                on_init = common_on_init,
                settings = {
                    Lua = {
                        runtime = {
                            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                            version = "LuaJIT",
                            -- Setup your lua path
                            path = vim.split(package.path, ";"),
                        },
                        diagnostics = {
                            -- Get the language server to recognize the `vim` global
                            globals = { "vim" },
                        },
                        workspace = {
                            -- Make the server aware of Neovim runtime files
                            library = {
                                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                            },
                            maxPreload = 100000,
                            preloadFileSize = 1000,
                        },
                    },
                },
            })
        else
            require("lspconfig")[server].setup({})
        end
    end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require("lspinstall").post_install_hook = function()
    setup_servers() -- reload installed servers
    vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end
