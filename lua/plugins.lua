return {
  {"tweekmonster/startuptime.vim"},

  {"tpope/vim-surround"},

  {"steelsojka/pears.nvim"},

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

  {
    "arcticicestudio/nord-vim",
  },
}
