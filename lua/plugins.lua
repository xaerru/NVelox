return {
  {"tpope/vim-surround"},

  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("core.treesitter").setup()
    end,
  },

  {
    "airblade/vim-rooter",
    config = function()
      vim.g.rooter_silent_chdir = 1
    end,
  },

  {
    "hoob3rt/lualine.nvim",
    requires = {"kyazdani42/nvim-web-devicons", opt = true}
  },

  {"akinsho/nvim-bufferline.lua", requires = "kyazdani42/nvim-web-devicons"},

  {
    "arcticicestudio/nord-vim",
    event = "ColorSchemePre"
  },
  
}
