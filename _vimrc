" Startify Settings
let g:startify_custom_header = [
  \ '                                ______      ',
  \ '            __                /\  ____`\    ',
  \ '   __   __ /\_\    ___ ___    \ \ \___\ \   ',
  \ '  /\ \ /\ \\/\ \ /` __` __`\   \ \  ____ \  ',
  \ '  \ \ \_/ / \ \ \/\ \/\ \/\ \   \ \ \___\ \ ',
  \ '   \ \___/   \ \_\ \_\ \_\ \_\   \ \_______\',
  \ '    \/__/     \/_/\/_/\/_/\/_/    \/_______/',
  \ '                                            ',
  \ ]
let g:ascii = [
  \ '                                            '
  \ ]
let g:startify_custom_footer = 'map(startify#fortune#boxed() + g:ascii, "\"   \".v:val")'
let g:startify_session_autoload = 1
let g:startify_change_to_dir = 1
let g:ctrlp_reuse_window = 'startify'
let g:startify_list_order = ['bookmarks', 'files']
let g:startify_skiplist = [
  \ 'COMMIT_EDITMSG',
  \ $VIMRUNTIME .'/doc',
  \ 'bundle/.*/doc',
  \ '\.DS_Store'
  \ ]

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
set encoding=UTF-8
set fileencoding=UTF-8
set showtabline=2
set noerrorbells visualbell t_vb=
highlight LineNr ctermfg=blue ctermbg=black
highlight ColorColumn ctermbg=white guibg=white
set fillchars=vert:\ ,fold:-,diff:-
highlight VertSplit guibg=black guibg=black ctermbg=blue ctermfg=blue

"""""""""""
" Key map "
"""""""""""
nnoremap n3 :NERDTreeToggle<Cr>
nnoremap <C-s>c :SyntasticCheck<Cr>
nnoremap <C-s>e :SyntasticReset<Cr>
nnoremap // :BLines!<Cr>
nnoremap <C-p> :Files<Cr>
nnoremap <C-f> :BLines<Cr>
nmap tb :TagbarToggle<Cr>
nnoremap <S-T> :tabe<Cr>
nnoremap <S-P> :tabp<Cr>
nnoremap <S-N> :tabn<Cr>

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
Plug 'lervag/vimtex'

" Quality of life
Plug 'vim-scripts/AutoComplPop'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'machakann/vim-highlightedyank'

"Theme and Color
Plug 'etdev/vim-hexcolor'
Plug 'itchyny/lightline.vim'
Plug 'mkalinski/vim-lightline_tagbar'
Plug 'mhinz/vim-startify'

Plug 'vwxyutarooo/nerdtree-devicons-syntax'
Plug 'ryanoasis/vim-devicons'

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
	\ 'colorscheme': 'nord',
       	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
       	\             [ 'readonly', 'filename', 'modified', 'gitbranch' ] ],
	\   'right': [ ['lineinfo'],
	\		['percent'],
	\		['tagbar', 'fileencoding', 'filetype'] ],
	\ },
	\ 'component_function': {'gitbranch': 'FugitiveHead', 'tagbar': 'lightline_tagbar#component'},
	\}

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

let g:syntastic_python_checkers = ['pylint']
let g:syntastic_cpp_checkers = ['gcc']
let g:syntastic_matlab_checkers = ['mlint']

let g:webdevicons_enable_nerdtree = 1
set complete+=kspell
set completeopt=menuone,longest

let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
