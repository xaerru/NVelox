" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

""" Vim-plug plug-ins
call plug#begin('~/.vim/bundle')

"" General
Plug 'mhinz/vim-startify' " Startup Page
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Conquer of completion, plugin manager
Plug 'tpope/vim-surround' " Operate on brackets
Plug 'airblade/vim-rooter' " Change directory to root repo
Plug 'puremourning/vimspector' " Debug
Plug 'szw/vim-maximizer' " Maximize 1 window
Plug 'liuchengxu/vim-which-key' " Show leader binds
Plug 'lukas-reineke/indent-blankline.nvim', {'branch': 'lua'} " Indents
Plug 'justinmk/vim-sneak' " Navigate faster
Plug 'arcticicestudio/nord-vim' " Nord theme
Plug 'vim-airline/vim-airline' " Status line
Plug 'vim-syntastic/syntastic' " Syntax linting
Plug 'ryanoasis/vim-devicons' " Icons
Plug 'preservim/nerdcommenter' " Commenter
Plug 'sbdchd/neoformat' " Code formatting
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' | " Git for nerdtree
            \ Plug 'ryanoasis/vim-devicons' " Icons

"" Git
Plug 'tpope/vim-fugitive' " Git support
Plug 'mhinz/vim-signify' " Git Signs
Plug 'tpope/vim-rhubarb' " Github support
Plug 'junegunn/gv.vim' " Git commit browser

"" Web dev
Plug 'pangloss/vim-javascript' " JavaScript Highlight
Plug 'leafgarland/typescript-vim' " TypeScript Highlight
Plug 'peitalin/vim-jsx-typescript' " JSX and TSX Highlight
Plug 'norcalli/nvim-colorizer.lua' " Colors

"" Floaterm
Plug 'voldikss/vim-floaterm' " Floating terminal windows
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy finder
Plug 'junegunn/fzf.vim' " Fuzzy finder in vim
Plug 'kevinhwang91/rnvimr', {'do': 'make sync'} " Ranger in vim

"" Haskell
Plug 'neovimhaskell/haskell-vim' " Syntax highlighting for Haskell
Plug 'enomsg/vim-haskellConcealPlus', { 'for': 'haskell' } " Haskell conceal
call plug#end()
