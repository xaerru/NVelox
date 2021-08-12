local function load(plugin)
    if plugin == "lsp" then
        string.format([[require("_nvlx.config.lsp")]])
    end
    string.format([[require("_nvlx.config.plugins.%s")]], plugin)
end

return {
    {
        "wbthomason/packer.nvim",
        event = "VimEnter",
    },

    {
        "neovim/nvim-lspconfig",
        after = "nvim-lspinstall",
        config = load("lsp"),
    },

    {
        "kabouzeid/nvim-lspinstall",
        event = "BufRead",
    },

    {
        "Pocco81/AutoSave.nvim",
        config = function()
            load("autosave")
        end,
        cond = function()
            return nvlx.general.autosave == true
        end,
    },

    {
        "grvxs/persistence.nvim",
        config = function()
            load("persistence")
        end,
        after = "packer.nvim",
    },

    {
        "maaslalani/nordbuddy",
        config = function()
            if require("_nvlx.colors") == false then
                vim.cmd("colorscheme " .. nvlx.general.colorscheme)
            end
        end,
        after = "packer.nvim",
    },

    {
        "norcalli/nvim-colorizer.lua",
        event = "BufRead",
        config = function()
            load("colorizer")
        end,
    },

    {
        "hrsh7th/nvim-compe",
        event = "InsertEnter",
        config = function()
            load("compe")
        end,
    },

    {
        "hrsh7th/vim-vsnip",
        event = "InsertCharPre",
    },

    {
        "rafamadriz/friendly-snippets",
        event = "InsertCharPre",
    },

    {
        "akinsho/nvim-bufferline.lua",
        config = function()
            load("bufferline")
        end,
        after = "nordbuddy",
    },

    {
        "hoob3rt/lualine.nvim",
        config = function()
            load("lualine")
        end,
        after = "nordbuddy",
    },

    {
        "nvim-treesitter/nvim-treesitter",
        event = "BufRead,BufNewFile,InsertEnter",
        config = function()
            load("treesitter")
        end,
    },

    {
        "sbdchd/neoformat",
        cmd = "Neoformat",
        config = function()
            load("neoformat")
        end,
    },

    {
        "kyazdani42/nvim-web-devicons",
        after = "plenary.nvim",
    },

    {
        "kyazdani42/nvim-tree.lua",
        cmd = "NvimTreeToggle",
        config = function()
            load("tree")
        end,
    },

    {
        "nvim-lua/plenary.nvim",
        event = "BufEnter",
    },

    {
        "nvim-lua/popup.nvim",
        after = "plenary.nvim",
    },

    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        config = function()
            load("telescope")
        end,
    },

    {
        "lewis6991/gitsigns.nvim",
        config = function()
            load("gitsigns")
        end,
        after = "plenary.nvim",
    },

    {
        "glepnir/dashboard-nvim",
        setup = function()
            load("dashboard")
        end,
        after = "packer.nvim",
    },

    {
        "windwp/nvim-autopairs",
        config = function()
            load("autopairs")
        end,
        after = "nvim-compe",
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufRead",
        setup = function()
            load("indentline")
        end,
    },

    {
        "akinsho/nvim-toggleterm.lua",
        config = function()
            load("terminal")
        end,
        after = "which-key.nvim",
    },

    {
        "folke/which-key.nvim",
        config = function()
            load("whichkey").load()
        end,
        after = "packer.nvim",
    },

    {
        "ygm2/rooter.nvim",
        config = function()
            load("rooter")
        end,
    },

    {
        "preservim/nerdcommenter",
        event = "CursorHold",
    },
}
