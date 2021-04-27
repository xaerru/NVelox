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
Plug 'jiangmiao/auto-pairs' " Brackets closer
Plug 'neovimhaskell/haskell-vim' " Syntax highlighting for Haskell
Plug 'arcticicestudio/nord-vim' " Nord theme
Plug 'vim-airline/vim-airline' " Status line
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' | " Git for nerdtree
            \ Plug 'ryanoasis/vim-devicons'        " Integrate vim-devicons
Plug 'ctrlpvim/ctrlp.vim' " Fuzzy file finder
Plug 'mhinz/vim-startify' " Start screen
Plug 'tpope/vim-fugitive' " Airline Extra Features
Plug 'airblade/vim-gitgutter' " Git for files
Plug 'pangloss/vim-javascript' " JavaScript Highlight
Plug 'leafgarland/typescript-vim' " TypeScript Highlight
Plug 'peitalin/vim-jsx-typescript' " JSX and TSX Highlight
Plug 'styled-components/vim-styled-components', { 'branch': 'main' } " Styled Components CSS highlight
Plug 'jparise/vim-graphql' " graphql Highlight

call plug#end()
