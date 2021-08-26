call plug#begin('~/.vim/plugged')

" Native LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/nvim-compe'
Plug 'glepnir/lspsaga.nvim'
Plug 'onsails/lspkind-nvim'
Plug 'kabouzeid/nvim-lspinstall'

" Programing Language/File Format
Plug 'chrisbra/csv.vim'
Plug 'davidhalter/jedi-vim'
Plug 'JuliaEditorSupport/julia-vim', { 'branch': 'master' }
Plug 'tpope/vim-markdown'
Plug 'lervag/vimtex'
Plug 'elzr/vim-json'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'prettier/vim-prettier', {'do': 'npm install'}

" Quality of life
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-fugitive'
Plug 'machakann/vim-highlightedyank'
Plug 'scrooloose/nerdcommenter'
" Plug 'kshenoy/vim-signature'
Plug 'mg979/vim-visual-multi'
Plug 'vimlab/split-term.vim'

" Theme and Color
Plug 'etdev/vim-hexcolor'
Plug 'itchyny/lightline.vim'
Plug 'macthecadillac/lightline-gitdiff'
Plug 'mengelbrecht/lightline-bufferline'
"Plug 'romgrk/barbar.nvim'
Plug 'EdenEast/nightfox.nvim'
Plug 'arcticicestudio/nord-vim'
Plug 'dracula/vim'

" File explorer
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'PhilRunninger/nerdtree-visual-selection'
Plug 'preservim/tagbar'


call plug#end()
