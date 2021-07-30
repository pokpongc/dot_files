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

set number
set encoding=UTF-8
set fileencoding=UTF-8
set showtabline=2
set noerrorbells visualbell t_vb=
highlight LineNr ctermfg=blue 
" ctermbg=black
highlight ColorColumn ctermbg=white guibg=white
set fillchars=vert:\ ,fold:-,diff:-
highlight VertSplit guibg=black guibg=black ctermbg=blue ctermfg=blue

"""""""""""
" Key map "
"""""""""""
nnoremap n3 :NERDTreeToggle<Cr>
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
Plug 'preservim/tagbar'
Plug 'lervag/vimtex'
Plug 'dense-analysis/ale'

" Quality of life
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'vim-scripts/AutoComplPop'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-fugitive'
Plug 'machakann/vim-highlightedyank'
Plug 'scrooloose/nerdcommenter'
Plug 'nathanaelkane/vim-indent-guides'

"Theme and Color
Plug 'arcticicestudio/nord-vim'
Plug 'etdev/vim-hexcolor'
" Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mkalinski/vim-lightline_tagbar'
Plug 'mhinz/vim-startify'

Plug 'scrooloose/nerdtree'
Plug 'vwxyutarooo/nerdtree-devicons-syntax'
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

call plug#end()
""""""""""""""""""
" airline config "
""""""""""""""""""
let g:airline_symbols = {}
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#left_sep = ''
let g:airline_left_sep = ''
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ''
let g:airline_skip_empty_sections = 1
let g:airline_right_alt_sep = '|'
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline#extensions#ale#enabled = 1

""""""""""""""""""""""""""""""""""
" cpp-enbhanced-highlight config "
""""""""""""""""""""""""""""""""""
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_no_function_highlight = 1

"""""""""""""
" fzf config "
""""""""""""""

""""""""""""""
" ALE config "
""""""""""""""
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}
let g:ale_c_gcc_autoinclude_source_dir = 1
let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1
let g:ale_fix_on_save = 1

" Nerd tree extra config
let g:webdevicons_enable_nerdtree = 1
set complete+=kspell
set completeopt=menuone,longest

let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

" Last
set listchars=nbsp:␣,eol:↲,tab:\┊\ ,extends:›,precedes:‹,trail:•

let &showbreak='↳ '

set cpoptions-=n

set list

set splitbelow
set termwinsize=10x0
colorscheme nord
