" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

""" Vim-plug plug-ins
call plug#begin('~/.vim/bundle') " Initialize Vim-plug

" Vim-plug plug-ins below
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Conquer of completion, plugin manager
Plug 'norcalli/nvim-colorizer.lua' " Colors
Plug 'vim-syntastic/syntastic' " Syntax linting
Plug 'preservim/nerdcommenter' " Commenter
Plug 'neovimhaskell/haskell-vim' " Syntax highlighting for Haskell
Plug 'arcticicestudio/nord-vim' " Nord theme
Plug 'vim-airline/vim-airline' " Status line
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' | " Git for nerdtree
            \ Plug 'ryanoasis/vim-devicons' " Icons
Plug 'ryanoasis/vim-devicons' " Icons
Plug 'tpope/vim-fugitive' " Airline Extra Features
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'pangloss/vim-javascript' " JavaScript Highlight
Plug 'leafgarland/typescript-vim' " TypeScript Highlight
Plug 'peitalin/vim-jsx-typescript' " JSX and TSX Highlight
Plug 'styled-components/vim-styled-components', { 'branch': 'main' } " Styled Components CSS highlight
Plug 'jparise/vim-graphql' " graphql Highlight
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'liuchengxu/vim-which-key'
Plug 'voldikss/vim-floaterm'
Plug 'metakirby5/codi.vim'
Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
Plug 'justinmk/vim-sneak'
Plug 'sbdchd/neoformat'
Plug 'enomsg/vim-haskellConcealPlus', { 'for': 'haskell' }
Plug 'lukas-reineke/indent-blankline.nvim', {'branch': 'lua'}
Plug 'mhinz/vim-startify'
Plug 'puremourning/vimspector'
Plug 'tpope/vim-surround'
call plug#end()
