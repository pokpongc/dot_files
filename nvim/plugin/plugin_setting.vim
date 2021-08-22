""""""""""""""""""""""""""""""""""
" cpp-enbhanced-highlight config "
""""""""""""""""""""""""""""""""""
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_no_function_highlight = 1

"""""""""""""""""""""""""""""
" latex-live-preview config "
"""""""""""""""""""""""""""""
let g:tex_flavor = "latex"
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_view_method = 'zathura'

let g:webdevicons_enable_nerdtree = 1
set complete+=kspell
set completeopt=menuone,longest

let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

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

colorscheme nightfox
