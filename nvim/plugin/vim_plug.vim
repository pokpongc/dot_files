call plug#begin('~/.vim/plugged')

" Programing Language/File Format
Plug 'chrisbra/csv.vim'
Plug 'daeyun/vim-matlab'
Plug 'JuliaEditorSupport/julia-vim', { 'branch': 'master' }
Plug 'tpope/vim-markdown'
Plug 'lervag/vimtex'
" Plug 'vim-syntastic/syntastic'
Plug 'elzr/vim-json'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Quality of life
Plug 'airblade/vim-gitgutter'
Plug 'octol/vim-cpp-enhanced-highlight'
" Plug 'vim-scripts/AutoComplPop'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-fugitive'
Plug 'machakann/vim-highlightedyank'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'kshenoy/vim-signature'
Plug 'junegunn/goyo.vim'

" Theme and Color
Plug 'arcticicestudio/nord-vim'
Plug 'etdev/vim-hexcolor'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/lightline.vim'
" Plug 'mhinz/vim-startify'
" Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'macthecadillac/lightline-gitdiff'
" Plug 'glepnir/dashboard-nvim'
Plug 'EdenEast/nightfox.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'dracula/vim'

" File explorer
" Plug 'weirongxu/coc-explorer'
" Plug 'scrooloose/nerdtree'
" Plug 'vwxyutarooo/nerdtree-devicons-syntax'
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'preservim/tagbar'

call plug#end()
