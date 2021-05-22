augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

let g:neoformat_rust_rustfmt = {
        \ 'exe': 'rustfmt',
        \ 'args': ['--edition 2018'],
        \ 'stdin': 1,
        \}
let g:neoformat_enabled_rust = ['rustfmt']
let g:neoformat_enabled_html = ['prettier']
let g:neoformat_enabled_css = ['prettier']
let g:neoformat_enabled_java = ['prettier']
let g:neoformat_enabled_javascript = ['prettier']
let g:neoformat_enabled_json = ['prettier']
let g:neoformat_enabled_typescript = ['prettier']
let g:neoformat_enabled_yaml = ['prettier']
