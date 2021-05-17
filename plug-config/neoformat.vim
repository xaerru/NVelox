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
