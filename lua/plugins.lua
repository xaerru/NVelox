return {
  {
    "wbthomason/packer.nvim",
    event = "VimEnter"
  },

  {
    "maaslalani/nordbuddy",
    config = function()
      vim.cmd [[
        colorscheme nordbuddy
        highlight Whitespace guifg=#434C5E
        ]]
    end,
    after = "packer.nvim"
  },

  {
    "Pocco81/AutoSave.nvim",
    after = "packer.nvim",
    config = function()
      require("plug_config.autosave")
    end
  },

  {
    "akinsho/nvim-bufferline.lua",
    after = "nordbuddy",
    config = function()
      require "plug_config.bufferline"
    end
  },

  {
    "hoob3rt/lualine.nvim",
    after = "nordbuddy",
    config = function()
      require("plug_config.lualine")
    end
  },

  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufRead",
    config = function()
      require("plug_config.treesitter")
    end
  },

  {
    "sbdchd/neoformat",
    config = function()
      require("plug_config.neoformat")
    end,
  },

  {
    "kyazdani42/nvim-web-devicons",
    after = "nordbuddy"
  },

  {
    "nvim-lua/plenary.nvim",
    event="BufWinEnter"
  },

  {
    "nvim-lua/popup.nvim",
    after = "plenary.nvim"
  },

  {
    "nvim-telescope/telescope.nvim",
    after = "nvim-web-devicons",
    config = function()
      require("plug_config.telescope")
    end
  },

  {
    "lewis6991/gitsigns.nvim",
    after = "plenary.nvim",
    config = function()
      require("plug_config.gitsigns")
    end
  },

  {
    "glepnir/dashboard-nvim",
    after = "packer.nvim",
    setup = function()
      require("plug_config.dashboard")
    end
  },

  {
    "phaazon/hop.nvim",
    after = "nordbuddy"
  },

  {
    "steelsojka/pears.nvim",
    config = function()
      require("plug_config.pears")
    end
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    setup = function()
      require("plug_config.indentline")
    end
  },

  {
    "voldikss/vim-floaterm",
    config = function()
      require("plug_config.floaterm")
    end,
    after = "which-key.nvim"
  },

  {
    "tweekmonster/startuptime.vim",
    cmd = "StartupTime"
  },

  {
    "folke/which-key.nvim",
    event = "BufWinEnter",
    config = function()
      require("plug_config.whichkey")
    end
  },

  {
    "ygm2/rooter.nvim",
    config = function()
      require("plug_config.rooter")
    end
  },

  {
    "preservim/nerdcommenter",
    after = "which-key.nvim"
  },
}
