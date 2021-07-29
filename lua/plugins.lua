return {
    {
        "wbthomason/packer.nvim",
        event = "VimEnter",
    },

    {
        "neovim/nvim-lspconfig",
    },

    {
        "tamago324/nlsp-settings.nvim",
    },

    {
        "jose-elias-alvarez/null-ls.nvim",
    },

    {
        "jdhao/better-escape.vim",
        config = function()
            vim.g.better_escape_interval = 200
            vim.g.better_escape_shortcut = { "jk", "kj" }
        end,
    },

    {
        "kabouzeid/nvim-lspinstall",
        config = function()
            require("lsp")
        end,
    },

    {
        "maaslalani/nordbuddy",
        config = function()
            vim.cmd([[
                colorscheme nordbuddy
                highlight TSNodeKey cterm=bold ctermfg=198 gui=bold guifg=#8fbcbb
                highlight TSNodeUnmatched ctermfg=242 guifg=#4c566a
        ]])
        end,
        after = "packer.nvim",
    },

    {
        "p00f/cphelper.nvim",
        rocks = "http",
        after = "nordbuddy",
    },

    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("plug_config.colorizer")
        end,
        after = "nvim-treesitter",
    },

    {
        "hrsh7th/nvim-compe",
        event = "InsertEnter",
        config = function()
            require("plug_config.compe")
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
        "Pocco81/AutoSave.nvim",
        config = function()
            require("plug_config.autosave")
        end,
        cond = function()
            return vim.g.auto_save == true
        end,
    },

    {
        "akinsho/nvim-bufferline.lua",
        after = "nordbuddy",
        config = function()
            require("plug_config.bufferline")
        end,
    },

    {
        "hoob3rt/lualine.nvim",
        after = "nvim-tree.lua",
        config = function()
            require("plug_config.lualine")
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        event = "BufRead",
        config = function()
            require("plug_config.treesitter")
        end,
    },

    {
        "sbdchd/neoformat",
        config = function()
            require("plug_config.neoformat")
        end,
    },

    {
        "kyazdani42/nvim-web-devicons",
        after = "packer.nvim"
    },

    {
        "kyazdani42/nvim-tree.lua",
        config = function()
            require("plug_config.tree")
        end,
        after = "nvim-web-devicons"
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
        after = "packer.nvim",
        config = function()
            require("plug_config.telescope")
        end,
    },

    {
        "lewis6991/gitsigns.nvim",
        after = "plenary.nvim",
        config = function()
            require("plug_config.gitsigns")
        end,
    },

    {
        "glepnir/dashboard-nvim",
        after = "packer.nvim",
        setup = function()
            require("plug_config.dashboard")
        end,
    },

    {
        "phaazon/hop.nvim",
        after = "nordbuddy",
    },

    {
        "windwp/nvim-autopairs",
        after = "nvim-compe",
        config = function()
            require("plug_config.autopairs")
        end,
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufRead",
        setup = function()
            require("plug_config.indentline")
        end,
    },

    {
        "akinsho/nvim-toggleterm.lua",
        config = function()
            require("plug_config.terminal")
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
            require("plug_config.whichkey")
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
            require("plug_config.rooter")
        end,
    },

    {
        "preservim/nerdcommenter",
    },
}
