return require('packer').startup(function()
  use 'arcticicestudio/nord-vim'
  
  use 'tpope/vim-surround'

  use {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("core.treesitter").setup()
    end,
  }

  use {
    "airblade/vim-rooter",
    config = function()
      vim.g.rooter_silent_chdir = 1
    end,
  }

  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
end)
