require'nvim-treesitter.configs'.setup {
  ensure_installed = {"c", "cpp", "rust", "python", "lua", "yaml"},
  highlight = {
    enable = true -- false will disable the whole extension
  },
  indent = {enable = true},
  -- TODO seems to be broken
  autotag = {enable = true},
}
