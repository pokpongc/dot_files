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
set showtabline=2

"""""""""""
" Key map "
"""""""""""
nnoremap n3 :NERDTree<Cr>
nnoremap <C-s>c :SyntasticCheck<Cr>
nnoremap <C-s>e :SyntasticReset<Cr>
nnoremap // :BLines!<Cr>
nnoremap <C-p> :Files<Cr>
nnoremap <C-f> :BLines<Cr>

""""""""""""""""""""
" Vim-plug Plugins "
""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" Programing Language/File Format
Plug 'chrisbra/csv.vim'
Plug 'daeyun/vim-matlab'
Plug 'JuliaEditorSupport/julia-vim', { 'branch': 'master' }
Plug 'tpope/vim-markdown'
Plug 'vim-syntastic/syntastic'
Plug 'preservim/tagbar'

Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'machakann/vim-highlightedyank'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"Theme and Color
Plug 'itchyny/lightline.vim'
Plug 'mkalinski/vim-lightline_tagbar'
Plug 'mhinz/vim-startify'

call plug#end()

""""""""""""""""""""
" lightline config "
""""""""""""""""""""
set laststatus=2
set noshowmode
set shortmess=F
let g:lightline_tagbar#format = '%s'
let g:lightline_tagbar#flags = ''
let g:lightline = {
	\ 'colorscheme': 'one',
       	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
       	\             [ 'readonly', 'filename', 'modified', 'gitbranch' ] ],
	\   'right': [ ['lineinfo'],
	\		['percent'],
	\		['tagbar', 'fileencoding', 'filetype'] ],
	\ },
	\ 'component_function': {'gitbranch': 'FugitiveHead', 'tagbar': 'lightline_tagbar#component'},
	\}
nmap tb :TagbarToggle<CR>
let g:tagbar_ctags_bin = 'E:\Program Files\ctags58\ctags.exe'

""""""""""""""
" fzf config "
""""""""""""""

"""""""""""""
" Syntastic "
"""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
