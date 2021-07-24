local g = vim.g

vim.cmd([[
augroup fmt
  autocmd!
  au BufWritePre * if &modified | try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry | endif
augroup END
]])

g.neoformat_rust_rustfmt = {
  exe = "rustfmt",
  args = { "--edition 2018" },
  stdin = true
}

g.neoformat_c_clangformat = {
  exe = "clang-format",
  stdin = true
}

g.neoformat_cpp_clangformat = {
  exe = "clang-format",
  args = {"--style='{BasedOnStyle: chromium, IndentWidth: 4}'"},
  stdin = true
}

g.neoformat_enabled_rust = {"rustfmt"}
g.neoformat_enabled_html = {"prettier"}
g.neoformat_enabled_css = {"prettier"}
g.neoformat_enabled_java = {"prettier"}
g.neoformat_enabled_javascript = {"prettier"}
g.neoformat_enabled_json = {"prettier"}
g.neoformat_enabled_typescript = {"prettier"}
g.neoformat_enabled_yaml = {"prettier"}
g.neoformat_enabled_cpp = {"clangformat"}
g.neoformat_enabled_c = {"clangformat"}
g.neoformat_enabled_python = {}
