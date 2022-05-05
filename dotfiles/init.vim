call plug#begin('~/.local/share/nvim/site/plugged')

" Color theme
Plug 'joshdick/onedark.vim'

" Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ervandew/supertab'

" Integration
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Language
Plug 'w0rp/ale'
Plug 'mattn/emmet-vim'
Plug 'sheerun/vim-polyglot'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

syntax on
colorscheme onedark
