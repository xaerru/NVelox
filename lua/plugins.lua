return {
  {
    "wbthomason/packer.nvim",
    event = "VimEnter"
  },

  {
    "nvim-telescope/telescope.nvim",
    requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}},
  },

  {"akinsho/nvim-bufferline.lua"},

  {"voldikss/vim-floaterm"},

  {"tweekmonster/startuptime.vim"},

  {"folke/which-key.nvim"},

  {"steelsojka/pears.nvim"},

  {"ygm2/rooter.nvim"},

  {
    "hoob3rt/lualine.nvim",
    requires = {"kyazdani42/nvim-web-devicons", opt = true}
  },

  {"maaslalani/nordbuddy"},

  {"preservim/nerdcommenter"},

  {"sbdchd/neoformat"},

  {"nvim-treesitter/nvim-treesitter"},

  {"lewis6991/gitsigns.nvim"},

  {"lukas-reineke/indent-blankline.nvim"}
}
