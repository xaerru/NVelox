nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map = {}
let g:which_key_map.t = {
      \ 'name' : '+terminal' ,
      \ 'g' : [':FloatermNew --height=0.8 --width=0.8 --position=center lazygit'     , 'git'],
      \ 'd' : [':FloatermNew --height=0.8 --width=0.8 --position=center lazydocker'  ,'docker'],
      \ 'r' : [':RnvimrToggle'                                                       , 'ranger'],
      \ 't' : [':FloatermToggle'                                                     , 'toggle'],
      \ 'y' : [':FloatermNew ytop'                                                   , 'ytop'],
      \ }

let g:which_key_map.r = {
      \ 'name' : '+run' ,
      \ 'r' : [':call CompileAndRun()<CR>'                                      , 'run'],
      \ 'i' : [':call StartREPL()<CR>'                                          , 'repl'],
      \ }

" Define a separator
let g:which_key_sep = '→'
" set timeoutlen=100

" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
"autocmd! FileType which_key
"autocmd  FileType which_key set laststatus=0 noshowmode noruler
  "\| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler
" Register which key map
call which_key#register('<Space>', "g:which_key_map")
