return {
    {
        "wbthomason/packer.nvim",
        event = "VimEnter",
    },

    {
        "neovim/nvim-lspconfig",
    },

    {
        "kabouzeid/nvim-lspinstall",
        config = function()
            require("config.lsp")
        end,
    },

    {
        "Pocco81/AutoSave.nvim",
        config = function()
            require("config.plugins.autosave")
        end,
    },

    {
        "grvxs/persistence.nvim",
        config = function()
            require("config.plugins.persistence")
        end,
        after = "packer.nvim",
    },

    {
        "maaslalani/nordbuddy",
    },

    {
        "p00f/cphelper.nvim",
        rocks = "http",
        after = "packer.nvim",
    },

    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("config.plugins.colorizer")
        end,
        after = "nvim-treesitter",
    },

    {
        "hrsh7th/nvim-compe",
        event = "InsertEnter",
        config = function()
            require("config.plugins.compe")
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
        after = "packer.nvim",
        config = function()
            require("config.plugins.bufferline")
        end,
    },

    {
        "hoob3rt/lualine.nvim",
        after = "packer.nvim",
        config = function()
            require("config.plugins.lualine")
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        event = "BufRead",
        config = function()
            require("config.plugins.treesitter")
        end,
    },

    {
        "sbdchd/neoformat",
        config = function()
            require("config.plugins.neoformat")
        end,
    },

    {
        "kyazdani42/nvim-web-devicons",
        after = "packer.nvim",
    },

    {
        "kyazdani42/nvim-tree.lua",
        cmd = "NvimTreeToggle",
        config = function()
            require("config.plugins.tree")
        end,
    },

    {
        "nvim-lua/plenary.nvim",
        event = "BufWinEnter",
    },

    {
        "nvim-lua/popup.nvim",
        after = "plenary.nvim",
    },

    {
        "nvim-telescope/telescope.nvim",
        after = "nvim-web-devicons",
        config = function()
            require("config.plugins.telescope")
        end,
    },

    {
        "lewis6991/gitsigns.nvim",
        after = "plenary.nvim",
        config = function()
            require("config.plugins.gitsigns")
        end,
    },

    {
        "glepnir/dashboard-nvim",
        after = "packer.nvim",
        setup = function()
            require("config.plugins.dashboard")
        end,
    },

    {
        "phaazon/hop.nvim",
        after = "packer.nvim",
    },

    {
        "windwp/nvim-autopairs",
        after = "nvim-compe",
        config = function()
            require("config.plugins.autopairs")
        end,
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufRead",
        setup = function()
            require("config.plugins.indentline")
        end,
    },

    {
        "akinsho/nvim-toggleterm.lua",
        config = function()
            require("config.plugins.terminal")
        end,
        after = "which-key.nvim",
    },

    {
        "tweekmonster/startuptime.vim",
        cmd = "StartupTime",
    },

    {
        "folke/which-key.nvim",
        event = "BufWinEnter",
        config = function()
            require("config.plugins.whichkey")
        end,
    },

    {
        "mfussenegger/nvim-ts-hint-textobject",
        config = function()
            require("tsht").config.hint_keys = { "h", "j", "f", "d", "n", "v", "s", "l", "a" }
        end,
        after = "nvim-treesitter",
    },

    {
        "mizlan/iswap.nvim",
        config = function()
            require("iswap").setup({
                keys = "hjfdnvsla",
            })
        end,
        after = "nvim-treesitter",
    },

    {
        "ygm2/rooter.nvim",
        config = function()
            require("config.plugins.rooter")
        end,
    },

    {
        "preservim/nerdcommenter",
        after = "packer.nvim",
    },
}
