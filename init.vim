"" misc
:autocmd BufNewFile *.cpp 0r ~/.config/nvim/templates/skeleton.cpp
:autocmd BufNewFile *.go 0r ~/.config/nvim/templates/skeleton.go
set mouse=a
au VimLeave * set guicursor=a:ver100
source $VIMRUNTIME/mswin.vim
behave mswin



""" Vim-plug plug-ins
call plug#begin('~/.vim/bundle') " Initialize Vim-plug

" Vim-plug plug-ins below
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Conquer of completion, plugin manager
Plug 'luochen1990/rainbow' " Rainbow parentheses
" Plug 'ObserverOfTime/discord.nvim', {'do': ':UpdateRemotePlugins'} " Discord rich presence
Plug 'vim-syntastic/syntastic' " Syntax linting
Plug 'tpope/vim-surround' " Bracket manager
Plug 'jiangmiao/auto-pairs' " Brackets closer
Plug 'jackguo380/vim-lsp-cxx-highlight' " C/C++ Highlighting
Plug 'vim-crystal/vim-crystal' " Crystal support
Plug 'neovimhaskell/haskell-vim' " Syntax highlighting for Haskell
Plug 'udalov/kotlin-vim' " Kotlin support
Plug 'dart-lang/dart-vim-plugin' " Dart support
Plug 'elixir-editors/vim-elixir' " Elixir support
Plug 'kchmck/vim-coffee-script' " Coffeescript support
Plug 'JuliaEditorSupport/julia-vim' " Julia support
Plug 'arcticicestudio/nord-vim' " Nord theme
Plug 'joshdick/onedark.vim' " One Dark Theme
Plug 'zah/nim.vim' " Nim support
Plug 'jdonaldson/vaxe' " Haxe support
Plug 'hylang/vim-hy' " Hy support
Plug 'vim-airline/vim-airline' " Status line
Plug 'preservim/nerdtree' " Nerd tree
Plug 'euclio/vim-markdown-composer' " Markdown Composer
" Vim-plug plug-ins above

call plug#end() " End Vim-plug


let g:mkdp_auto_close = 0
nnoremap <M-m> :MarkdownPreview<CR>


""" Vundle plugins configuration

"" coc.nvim coc-snippets
imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-j> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'
imap <C-j> <Plug>(coc-snippets-expand-jump)
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:coc_snippet_next = '<tab>'

"" vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1 " Start indentation guides on startup
let g:indent_guides_guide_size = 1 " The guide size is 1

"" vim-airline
let g:airline_powerline_fonts = 1

" rainbow
autocmd VimEnter,BufNewFile *.clj RainbowToggleOn " Toggle the parentheses on a Clojure file
autocmd VimEnter,BufNewFile *.java RainbowToggleOn " Toggle the parentheses on a Java file
autocmd VimEnter,BufNewFile *.lisp RainbowToggleOn " Toggle the parentheses on a Lisp file
" Configuration:
" Java -> Color '{' and '}'
" Clojure and Lisp -> Color '(', ')' and ','
let g:rainbow_conf = {
    \'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
    \'guis': [''],
    \'cterms': [''],
    \'operators': '_,_',
    \'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \'separately': {
        \'*': {},
        \'java': {
            \'operators': '',
            \'parentheses': ['start=/{/ end=/}/ fold'],
            \'ctermfgs': ['red', 'yellow', 'lightgreen', 'cyan', 'blue', 'magenta']
        \},
        \'clojure': {
            \'ctermfgs': ['red', 'yellow', 'lightgreen', 'cyan', 'blue', 'magenta']
        \},
        \'lisp': {
            \'ctermfgs': ['red', 'yellow', 'lightgreen', 'cyan', 'blue', 'magenta']
        \},
        \'hy': {
            \'ctermfgs': ['red', 'yellow', 'lightgreen', 'cyan', 'blue', 'magenta']
        \}
    \}
\}

"" vim-crystal
" Highlight variables and methods as identifiers
highlight! link crystalLocalVariableOrMethod Identifier

"" haskell-vim
let g:haskell_enable_quantification = 1   " Enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " Enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " Enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " Enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " Enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " Enable highlighting of `static`
let g:haskell_backpack = 1                " Enable highlighting of backpack keywords

let g:haskell_indent_if = 3 " Indent 'then' and 'else' by 3 spaces from the corresponding 'if'
let g:haskell_indent_case = 2 " Indent cases of 'case' by 2 spaces
let g:haskell_indent_before_where = 2 " Indent 'where' by 2 spaces
let g:haskell_indent_after_bare_where = 2 " Indent bindings by 2 spaces after corresponding base 'where'
let g:haskell_indent_where = 6 " Indent bindings by 6 spaces after corresponding not bare 'where'
let g:haskell_indent_guard = 2 " Indent guard clauses by 2 spaces

"" dart-vim-plugin
let g:dart_html_in_string = v:true " Enable highlighting for HTML in strings
let g:dart_style_guide = 4 " Set the indentation to 4 spaces

"" vim-coffee-script
" Don't highlight trailing spaces
highlight link coffeeSpaceError NONE









""" Neovim settings

"" Editor Settings
set autoread " Automatically re-read files modified outside of Vim
set backspace=indent,eol,start " Allow backspacing over indentation, line breaks and insertion starts
set splitright " Set new veritacl buffers to split to the right
autocmd VimEnter,BufNewFile *.xml set shiftwidth=2 " Set the indentation to two spaces for XML files
autocmd VimEnter,BufNewFile *.hs set shiftwidth=2 " Set the indentation to two spaces for Haskell files
autocmd VimEnter,BufNewFile *.rb set shiftwidth=4 " Set the indentation to four spaces for Ruby files
autocmd VimEnter,BufNewFile *.ex set shiftwidth=4 " Set the indentation to four spaces for Elixir files

"" UI Settings
syntax on " Syntax highlighting
set number " Line numbers
set ruler " Show position of cursor
set title " Show name of file and the path to it
set background=dark " Use colors suitable for dark background

"" Text Settings
set enc=utf-8 " UTF-8 encoding
set linebreak " Line breaks on whitespaces
set scrolloff=5 " 5 Lines above/below the cursor while scrolling

"" Tabulation Settings
set tabstop=4 " Tabulations are in the proper place
set shiftwidth=4 " Tabulation size if 4
set expandtab " Tabulations are expanded
set smartindent " Smart indentation
set autoindent " New line indentation based on the previous line
set pastetoggle=<F2> " Set the paste toggle to be (<F2>)

"" Search Settings
set hlsearch " Highlight words found using the search

"" Clipboard settings
set list lcs=tab:┆·,trail:·,precedes:,extends:
set hidden noshowmode nowrap termguicolors splitright splitbelow switchbuf=useopen
set ignorecase smartcase number relativenumber
set clipboard=unnamedplus
set inccommand=nosplit
let g:tex_flavor = 'latex'
let g:highlightedyank_highlight_duration = 300
runtime macros/sandwich/keymap/surround.vim " use vim-surround keybinds

let g:syntastic_python_python_exec = 'python3'
let g:syntastic_python_checkers = ['python']


""" Commands

"" Start a terminal in a new buffer with a command
function! s:StartTerminal(command)
    " If the command isn't empty
    if a:command != ''
        " Save the file
        exec 'w'
        " Create a new buffer
        exec 'vnew'
        " Start a terminal with the command
        exec 'term ' . a:command
        " Be able to insert text
        exec 'startinsert'
    endif
endfunction

" Call the function CompileAndRun (<F9>)
map <F6> :call <SID>CompileAndRun()<CR>
imap <F6> <ESC>:call <SID>CompileAndRun()<CR>
"" Runs the code in the file using the filetype
function! s:CompileAndRun()
    let l:file = expand('%:p') " The absolute path to the file
    let l:noext = expand('%:p:r') " The path to the file without the extension
    let l:path = expand('%:p:h') " The absolute path to the file without the name
    let l:name = expand('%:t:r') " The file name without the extension
    
    " The possible commands
    let l:commandMap = {
        \'haxe'      : 'haxe --main ' . l:file . ' --interp',
        \'dart'      : 'dart run ' . l:file,
        \'java'      : 'javac ' . l:file . ' && java -cp ' . l:path . ' ' . l:name . ' && find ' . l:path . ' -regex "' . l:noext . '\.class" -delete -or -regex "' . l:noext . '$.+\.class" -delete',
        \'kotlin'    : 'kotlinc ' . l:file . ' -include-runtime -d ' . l:name . '.jar && java -jar ' . l:noext . '.jar && rm ' . l:noext . '.jar',
        \'scala'     : 'scalac ' . l:file . ' && scala -classpath ' . l:path . ' ' . l:name . ' && find ' . l:path . ' -regex "' . l:noext . '\.class" -delete -or -regex "' . l:noext . '$.+\.class" -delete',
        \'groovy'    : 'groovy -classpath ' . l:path . ' ' . l:name,
        \'clojure'   : 'clojure ' . l:file,
        \'lisp'      : 'clisp ' . l:file,
        \'hy'        : 'hy ' . l:file,
        \'python'    : 'python3 ' . l:file,
        \'r'         : 'Rscript ' . l:file,
        \'julia'     : 'julia ' . l:file,
        \'nim'       : 'nim compile -p:' . l:path . ' ' . l:name . '.nim && ' . l:noext . ' && rm ' . l:noext,
        \'c'         : 'gcc ' . l:file . ' -o ' . l:noext . ' && ' . l:noext . ' && rm ' . l:noext,
        \'cpp'       : 'g++ -std=c++17 ' . l:file . ' && ' . './a.out',
        \'cs'        : 'mcs ' . l:file . ' && mono ' . l:noext . '.exe && rm ' . l:noext . '.exe',
        \'d'         : 'dmd ' . l:file . ' && ' . l:noext . ' && rm ' . l:noext . '.o && rm ' . l:noext,
        \'rust'      : 'rustc ' . l:file . ' && ' . l:noext . ' && rm ' . l:noext,
        \'go'        : 'go run ' . l:file,
        \'fortran'   : 'f95 ' . l:file . ' -o ' . l:name . ' && ' . l:noext . ' && rm ' . l:noext,
        \'pascal'    : 'fpc ' . l:file . ' && ' . l:noext . ' && rm ' . l:noext . '.o && rm ' . l:noext,
        \'haskell'   : 'ghc -dynamic ' . l:file . ' && ' . l:noext . ' && rm ' . l:noext . '.hi && rm ' . l:noext . '.o && rm ' . l:noext,
        \'ocaml'     : 'ocaml ' . l:file,
        \'lua'       : 'lua ' . l:file,
        \'sh'        : 'bash ' . l:file,
        \'perl'      : 'perl ' . l:file,
        \'php'       : 'php ' . l:file,
        \'javascript': 'node ' . l:file,
        \'typescript': 'tsc ' . l:file . ' && node ' . l:noext . '.js && rm ' . l:noext . '.js',
        \'coffee'    : 'coffee ' . l:file,
        \'ruby'      : 'ruby ' . l:file,
        \'crystal'   : 'crystal ' . l:file,
        \'elixir'    : 'elixir -r ' . l:file . ' -e ''' . l:name . '.main''',
        \'erlang'    : 'erlc ' . l:file . ' && erl -pa ' . l:path . ' -s ' . l:name . ' main -s init stop && rm ' . l:noext . '.beam',
        \'st'        : 'gst ' . l:file
    \}
    
    " Get the command
    let l:command = get(l:commandMap, &filetype, '')
    " Start a terminal
    call s:StartTerminal(l:command)
endfunction

" Call the function StartREPL (<F10>)
map <F5> :call <SID>StartREPL()<CR>
imap <F5> <ESC>:call <SID>StartREPL()<CR>
"" Runs a REPL using the filetype
function! s:StartREPL()
    " The possible commands
     let l:file = expand('%:p') " The absolute path to the file
     let l:noext = expand('%:p:r') " The path to the file without the extension
     let l:path = expand('%:p:h') " The absolute path to the file without the name
     let l:name = expand('%:t:r') " The file name without the extension
     let l:commandMap = {
        \'haxe'      : 'npx haxe-repl',
        \'dart'      : '',
        \'java'      : 'jshell',
        \'kotlin'    : 'kotlin',
        \'scala'     : 'scala',
        \'groovy'    : 'groovysh',
        \'clojure'   : 'clojure',
        \'lisp'      : 'clisp',
        \'hy'        : 'hy',
        \'python'    : 'python3',
        \'r'         : 'R',
        \'julia'     : 'julia',
        \'nim'       : '',
        \'c'         : '',
        \'cpp'       : '',
        \'cs'        : '',
        \'d'         : '',
        \'rust'      : 'papyrus',
        \'go'        : 'igo',
        \'fortran'   : '',
        \'pascal'    : '',
        \'haskell'   : 'ghci ' . l:file,
        \'ocaml'     : 'ocaml',
        \'lua'       : 'lua',
        \'sh'        : 'bash',
        \'perl'      : 'perl -de1',
        \'php'       : 'php -a',
        \'javascript': 'node',
        \'typescript': 'ts-node',
        \'coffee'    : 'coffee',
        \'ruby'      : 'irb',
        \'crystal'   : 'icr',
        \'elixir'    : 'iex',
        \'erlang'    : 'erl',
        \'st'        : 'gst'
    \}
    
    " Get the command
    let l:command = get(l:commandMap, &filetype, '')
    " Start a terminal
    call s:StartTerminal(l:command)
endfunction

"" Send file to desktop
map <c-d> :call <SID>SendToDesktop()<CR>
function! s:SendToDesktop()
    exec "w"
    exec "!cpdt %:p"
endfunction

"" Colors
syntax enable
set termguicolors
set background=dark
color nord

"" Keybinds
nnoremap <F3> :%y+ <CR>
nnoremap <C-n> :NERDTreeToggle<CR>

