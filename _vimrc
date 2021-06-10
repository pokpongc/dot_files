" Vim with all enhancements
source $VIMRUNTIME/vimrc_example.vim

" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

set number relativenumber
set encoding=utf-8
set fileencoding=utf-8

call plug#begin('~/.vim/plugged')

Plug 'JuliaEditorSupport/julia-vim', { 'branch': 'master' }
Plug 'junegunn/goyo.vim'
Plug 'daeyun/vim-matlab'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'machakann/vim-highlightedyank'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-markdown'

call plug#end()

""""""""""""""""""""
" lightline config "
""""""""""""""""""""
set laststatus=2
set noshowmode
set shortmess=F
let g:lightline = {
	\ 'colorscheme': 'one',
       	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
       	\             [ 'readonly', 'filename', 'modified', 'gitbranch' ] ]
	\ },
	\ 'component_fuction': {'gitbranch': 'FugitiveHead'},
	\}

""""""""""""""
" fzf config "
""""""""""""""
nnoremap <C-p> :Files<Cr>
nnoremap <C-f> :BLines<Cr>
nmap // :BLines!<Cr>
