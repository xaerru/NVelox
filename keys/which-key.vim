nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map = {}
let g:which_key_map.t = {
      \ 'name' : '+terminal' ,
      \ 'g' : [':FloatermNew --height=0.8 --width=0.8 --position=center lazygit'     , 'git'],
      \ 'd' : [':FloatermNew --height=0.8 --width=0.8 --position=center lazydocker'  ,'docker'],
      \ 'v' : [':FloatermNew --height=0.5 --width=0.5 --wintype=vsplit'              ,'Vertical'],
      \ 'h' : [':FloatermNew --height=0.5 --width=0.5 --wintype=split'               ,'Horizontal'],
      \ 'f' : [':edit +term | startinsert'                                           ,'Full'],
      \ 'r' : [':RnvimrToggle'                                                       , 'ranger'],
      \ 't' : [':w | FloatermToggle'                                                 , 'toggle'],
      \ 'y' : [':FloatermNew ytop'                                                   , 'ytop'],
      \ }

let g:which_key_map.r = {
      \ 'name' : '+run' ,
      \ 'r' : [':call CompileAndRun()<CR>'                                      , 'run'],
      \ 'i' : [':call StartREPL()<CR>'                                          , 'repl'],
      \ }

let g:which_key_map.s = {
      \ 'name' : '+sessions' ,
      \ 'l' : [':SLoad'                                      , 'Load Session'],
      \ 's' : [':SSave!'                                     , 'Save Session'],
      \ 'd' : [':SDelete!'                                   , 'Delete Session'],
      \ 'q' : [':SClose'                                     , 'Close Session'],
      \ }

let g:which_key_map.u = {
      \ 'name' : '+util' ,
      \ 'y' : [':%y+'                                          , 'Copy All text'],
      \ 'd' : [':%d+'                                          , 'Delete All text'],
      \ 'q' : [':bd'                                           , 'Close buffer'],
      \ 'r' : [':Ag'                                           , 'Grep'],
      \ 'f' : [':Files'                                        , 'Files'],
      \ 'g' : [':GFiles'                                       , 'Git Files'],
      \ 'h' : [':Files ~'                                      , 'Home Files'],
      \ 'b' : [':Buffers'                                      , 'Buffers'],
      \ }

let g:which_key_map.w = {
      \ 'name' : '+windows' ,
      \ 'w' : ['<C-W>w'     , 'other-window']          ,
      \ 'q' : ['<C-W>c'     , 'delete-window']         ,
      \ '-' : ['<C-W>s'     , 'split-window-below']    ,
      \ '|' : ['<C-W>v'     , 'split-window-right']    ,
      \ '2' : ['<C-W>v'     , 'layout-double-columns'] ,
      \ 'h' : ['<C-W>h'     , 'window-left']           ,
      \ 'j' : ['<C-W>j'     , 'window-below']          ,
      \ 'l' : ['<C-W>l'     , 'window-right']          ,
      \ 'k' : ['<C-W>k'     , 'window-up']             ,
      \ 'H' : ['<C-W>5<'    , 'expand-window-left']    ,
      \ 'J' : [':resize +5'  , 'expand-window-below']   ,
      \ 'L' : ['<C-W>5>'    , 'expand-window-right']   ,
      \ 'K' : [':resize -5'  , 'expand-window-up']      ,
      \ '=' : ['<C-W>='     , 'balance-window']        ,
      \ 's' : ['<C-W>s'     , 'split-window-below']    ,
      \ 'v' : ['<C-W>v'     , 'split-window-below']    ,
      \ '?' : ['Windows'    , 'fzf-window']            ,
      \ }

let g:which_key_map.d = {
      \ 'name' : '+debug',
      \ 'd' : 'Launch'    ,
      \ 'c' : 'Code'    ,
      \ 't' : 'Tagpage'    ,
      \ 'v' : 'Variables'    ,
      \ 'w' : 'Watches'    ,
      \ 's' : 'Stack trace'    ,
      \ 'o' : 'Output'    ,
      \ 'tcb' : 'CleanLineBreakpoint'    ,
      \ 'l' : 'StepInto'    ,
      \ 'j' : 'StepOver'    ,
      \ 'k' : 'StepOut'    ,
      \ '_' : 'Restart'    ,
      \ '<space>' : 'Continue'    ,
      \ 'rc' : 'RunToCursor'    ,
      \ 'bp' : 'ToggleBreakPoint'    ,
      \ 'dcbp' : 'ToggleConditionalBreakpoint'    ,
      \ }

let g:which_key_map.g = {
      \ 'name' : '+git',
      \ 'j' : 'NextChange'    ,
      \ 'k' : 'PreviousChange'    ,
      \ 'b' : [':GBrowse', 'WebBrowse']    ,
      \ 'c' : [':GV', 'CommitBrowse']    ,
      \ 'd' : [':Gdiffsplit', 'SplitDiff']    ,
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
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler
" Register which key map
call which_key#register('<Space>', "g:which_key_map")
