" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

""" Vim-plug plug-ins
call plug#begin('~/.vim/bundle')

"" General
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " TreeSitter
Plug 'mhinz/vim-startify' " Startup Page
Plug 'nvim-lua/plenary.nvim' " Dependency for cphelper.vim
Plug 'p00f/cphelper.nvim' " Competitive Programming
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Conquer of completion, plugin manager
Plug 'tpope/vim-surround' " Operate on brackets
Plug 'airblade/vim-rooter' " Change directory to root repo
Plug 'puremourning/vimspector' " Debug
Plug 'szw/vim-maximizer' " Maximize 1 window
Plug 'liuchengxu/vim-which-key' " Show leader binds
Plug 'lukas-reineke/indent-blankline.nvim' " Indents
Plug 'justinmk/vim-sneak' " Navigate faster
Plug 'arcticicestudio/nord-vim' " Nord theme
Plug 'vim-airline/vim-airline' " Status line
Plug 'ryanoasis/vim-devicons' " Icons
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  } " Markdowm preview
Plug 'preservim/nerdcommenter' " Commenter
Plug 'sbdchd/neoformat' " Code formatting
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' | " Git for nerdtree
            \ Plug 'ryanoasis/vim-devicons' " Icons
Plug 'wakatime/vim-wakatime' " Wakatime

"" Git
Plug 'tpope/vim-fugitive' " Git support
Plug 'mhinz/vim-signify' " Git Signs
Plug 'tpope/vim-rhubarb' " Github support

"" Web dev
Plug 'norcalli/nvim-colorizer.lua' " Colors

"" Floaterm
Plug 'voldikss/vim-floaterm' " Floating terminal windows
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy finder
Plug 'junegunn/fzf.vim' " Fuzzy finder in vim

"" Haskell
Plug 'neovimhaskell/haskell-vim' " Syntax highlighting for Haskell
Plug 'enomsg/vim-haskellConcealPlus', { 'for': 'haskell' } " Haskell conceal
call plug#end()
