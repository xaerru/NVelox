return {
    {
        "wbthomason/packer.nvim",
    },

    {
        "lewis6991/impatient.nvim",
        after = "packer.nvim",
        config = function()
            require("impatient")
        end,
        rocks = "mpack",
    },

    {
        "neovim/nvim-lspconfig",
        after = "nvim-lspinstall",
        config = function()
            if vim.fn.eval("&filetype") ~= "man" then
                require("_nvlx.config.lsp")
            end
        end,
    },

    {
        "kabouzeid/nvim-lspinstall",
        event = "CursorHold",
    },

    {
        "Pocco81/AutoSave.nvim",
        config = function()
            require("_nvlx.config.plugins.autosave")
        end,
        disable = not nvlx.general.autosave,
        after = "nordbuddy",
    },

    {
        "grvxs/persistence.nvim",
        config = function()
            require("_nvlx.config.plugins.persistence")
        end,
        after = "nordbuddy",
    },

    {
        "maaslalani/nordbuddy",
        event = "VimEnter",
        config = function()
            if require("_nvlx.colors") == false then
                vim.cmd("colorscheme " .. nvlx.general.colorscheme)
            end
        end,
    },

    {
        "norcalli/nvim-colorizer.lua",
        event = "BufReadPost",
        config = function()
            require("_nvlx.config.plugins.colorizer")
        end,
    },

    {
        "hrsh7th/nvim-compe",
        event = "InsertEnter",
        config = function()
            require("_nvlx.config.plugins.compe")
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
            require("_nvlx.config.plugins.bufferline")
        end,
        after = "nordbuddy",
    },

    {
        "famiu/feline.nvim",
        config = function()
            require("_nvlx.config.plugins.feline")
        end,
        after = "nordbuddy",
    },

    {
        "nvim-treesitter/nvim-treesitter",
        event = "BufRead,BufNewFile,InsertEnter",
        config = function()
            require("_nvlx.config.plugins.treesitter")
        end,
    },

    {
        "sbdchd/neoformat",
        cmd = "Neoformat",
        config = function()
            require("_nvlx.config.plugins.neoformat")
        end,
    },

    {
        "kyazdani42/nvim-web-devicons",
        after = "nordbuddy",
    },

    {
        "kyazdani42/nvim-tree.lua",
        cmd = "NvimTreeToggle",
        config = function()
            require("_nvlx.config.plugins.tree")
        end,
    },

    {
        "nvim-lua/plenary.nvim",
        event = "BufEnter",
    },

    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        config = function()
            require("_nvlx.config.plugins.telescope")
        end,
    },

    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("_nvlx.config.plugins.gitsigns")
        end,
        after = "plenary.nvim",
    },

    {
        "glepnir/dashboard-nvim",
        setup = function()
            require("_nvlx.config.plugins.dashboard")
        end,
        after = "nordbuddy",
    },

    {
        "windwp/nvim-autopairs",
        config = function()
            require("_nvlx.config.plugins.autopairs")
        end,
        after = "nvim-compe",
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("_nvlx.config.plugins.indentline")
        end,
        after = "nordbuddy",
    },

    {
        "akinsho/nvim-toggleterm.lua",
        config = function()
            require("_nvlx.config.plugins.terminal")
        end,
        after = "which-key.nvim",
    },

    {
        "folke/which-key.nvim",
        config = function()
            require("_nvlx.config.plugins.whichkey").load()
        end,
        after = "nordbuddy",
    },

    {
        "ygm2/rooter.nvim",
        config = function()
            require("_nvlx.config.plugins.rooter")
        end,
        after = "nordbuddy",
    },

    {
        "preservim/nerdcommenter",
        event = "CursorHold",
    },
}
