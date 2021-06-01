" enable tabline
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ''
"let g:airline#extensions#tabline#left_alt_sep = ''
"let g:airline#extensions#tabline#right_sep = ''
"let g:airline#extensions#tabline#right_alt_sep = ''

let g:airline_section_z="%p%% %#__accent_bold#%{g:airline_symbols.linenr}:%l%#__restore__#%#__accent_bold#%#__restore__#%#__accent_bold# %{g:airline_symbols.colnr}:%v%#__restore__#"

" enable powerline fonts
let g:airline_powerline_fonts = 1
"let g:airline_left_sep = ''
"let g:airline_right_sep = ''

" Switch to your current theme
let g:airline_theme = 'nord'

" Always show tabs
set showtabline=2
