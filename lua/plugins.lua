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
        cond = function()
            return nvlx.general.autosave == true
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
        config = function()
            require("config.plugins.bufferline")
        end,
        after = "packer.nvim",
    },

    {
        "hoob3rt/lualine.nvim",
        config = function()
            require("config.plugins.lualine")
        end,
        after = "packer.nvim",
    },

    {
        "nvim-treesitter/nvim-treesitter",
        event = "BufEnter",
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
        after = "plenary.nvim",
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
        config = function()
            require("config.plugins.telescope")
        end,
        after = "nvim-web-devicons",
    },

    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("config.plugins.gitsigns")
        end,
        after = "plenary.nvim",
    },

    {
        "glepnir/dashboard-nvim",
        setup = function()
            require("config.plugins.dashboard")
        end,
        after = "packer.nvim",
    },

    {
        "windwp/nvim-autopairs",
        config = function()
            require("config.plugins.autopairs")
        end,
        after = "nvim-compe",
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
        "folke/which-key.nvim",
        config = function()
            require("config.plugins.whichkey")
        end,
        after = "packer.nvim",
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
