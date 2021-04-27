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
