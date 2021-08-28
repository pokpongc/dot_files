" Tex
let g:tex_flavor = "latex"
let g:vimtex_view_general_viewer = 'mupdf'
let g:vimtex_view_method = 'mupdf'

" devicons
let g:webdevicons_enable_nerdtree = 1

" gitgutter
let g:gitgutter_sign_added = ''
let g:gitgutter_sign_modified = ''
let g:gitgutter_sign_removed = ''
let g:gitgutter_sign_removed_first_line = ''
let g:gitgutter_sign_removed_above_and_below = ''
let g:gitgutter_sign_modified_removed = ''

" goyo
let g:goyo_width = 100
function! s:goyo_enter()
    set wrap                              " Display long lines as just one line
endfunction

function! s:goyo_leave()
    set nowrap
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
