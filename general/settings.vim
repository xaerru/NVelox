" set leader key
let g:mapleader = "\<Space>"

syntax enable                           " Enables syntax highlighing
set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
set encoding=utf-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler                               " Show the cursor position all the time
set iskeyword+=-                        " treat dash separated words as a word text object"
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright
set cmdheight=2                         " More space for displaying messageset splitright
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " So that I can see `` in markdown files
set tabstop=4                           " Insert 2 spaces for a tab
set shiftwidth=4                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set laststatus=0                        " Always display the status line
set number                              " Line numbers
set cursorline                          " Enable highlighting of the current line
set background=dark                     " tell vim what the background color looks like
set showtabline=2                       " Always show tabs
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set nobackup                            " This is recommended by coc
set autoread                            " Automatically re-read files modified outside of Vim
set backspace=indent,eol,start          " Allow backspacing over indentation, line breaks and insertion starts
set nowritebackup                       " This is recommended by coc
set title                               " Show name of file and the path to it
set updatetime=300                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set formatoptions-=cro                  " Stop newline continution of comments
set clipboard=unnamedplus               " Copy paste between vim and everything else
set pastetoggle=<F2>                    " Set the paste toggle to be (<F2>)
set linebreak                           " Line breaks on whitespaces
set scrolloff=5                         " 5 Lines above/below the cursor while scrolling
set termguicolors                       " Set termguicolors
set inccommand=nosplit                  " Replace live
"set guifont=JetBrains\ Mono\ Nerd\ Font
set list lcs=tab:┆·,trail:·,precedes:,extends:

au VimLeave * set guicursor=a:ver100 " Set cursor to Beam after leaving vim

autocmd VimEnter,BufNewFile *.xml set shiftwidth=2 " Set the indentation to two spaces for XML files
autocmd VimEnter,BufNewFile *.hs set shiftwidth=2 " Set the indentation to two spaces for Haskell files
" Close the terminal if it's shell
autocmd TermClose term://*
      \ if (expand('<afile>') =~ "/usr/bin/fish") |
      \   call nvim_input('<CR>')  |
      \ endif
" Make it work with alacritty
autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"
let g:tex_flavor = 'latex'
let g:highlightedyank_highlight_duration = 300

" Search Settings
set hlsearch " Highlight words found using the search

au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC

" You can't stop me
cmap w!! w !sudo tee %
