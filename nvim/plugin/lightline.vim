set showtabline=2

let g:lightline_gitdiff#indicator_added = ''
let g:lightline_gitdiff#indicator_deleted = ''
let g:lightline_gitdiff#indicator_modified = ''
let g:lightline_gitdiff#min_winwidth = '70'

let g:lightline#bufferline#show_number = 2
let g:lightline#bufferline#read_only = ' '
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#unicode_symbols = 1
let g:lightline#bufferline#clickable = 1
let g:lightline#bufferline#filename_modifier= ':.'
let g:lightline#bufferline#more_buffers = '...'
let g:lightline#bufferline#number_map = {
\ 0: '⁰', 1: '¹', 2: '²', 3: '³', 4: '⁴',
\ 5: '⁵', 6: '⁶', 7: '⁷', 8: '⁸', 9: '⁹'}
let g:lightline#bufferline#modified = ' ●'

let g:lightline = {
  \ 'colorscheme': 'nightfox',
  \   'active': {
  \     'left': [['mode', 'paste', ],
  \              ['gitbranch', 'filename', 'tagbar']],
  \     'right': [['percent', 'lineinfo' ],
  \               ['fileformat', 'fileencoding', 'filetype'],
  \               ],
  \   },
  \ 'tabline': {
  \   'left': [ ['buffers'] ],
  \   'right': [ ['gitstatus'] ]
  \ },
  \ 'component_expand': {
  \   'buffers': 'lightline#bufferline#buffers'
  \ },
  \ 'component_type': {
  \   'buffers': 'tabsel',
\     'trailing': 'warning'
  \ },
  \   'component': {
  \     'gitstatus': '%<%{lightline_gitdiff#get_status()}',
  \     'tagbar': '%{tagbar#currenttag(" %s", " No Tag")}',
  \   },
  \   'component_visible_condition': {
  \     'gitstatus': 'lightline_gitdiff#get_status() !=# ""',
  \   },
  \   'component_function': {'readonly': 'LightlineReadonly',
  \                           'lineinfo': 'LightlineLineinfo',
  \                           'filename': 'LightlineFilename',
  \                           'gitbranch': 'LightlineGitbranch',
  \                           'filetype': 'LightlineFiletype',
  \ },
  \   'subseparator': { 'left': '', 'right': ' '},
  "\   'subseparator': { 'left': '', 'right': '⏽'},
 \ }


let g:lightline#trailing_whitespace#indicator = '•'

function! s:trim(maxlen, str) abort
    let trimed = len(a:str) > a:maxlen ? a:str[0:a:maxlen] . '..' : a:str
    return trimed
endfunction

function! LightlineReadonly() abort
    let ftmap = {
                \ 'nerdtree': '',
                \ 'fugitive': '',
                \ 'vista': ''
                \ }
    let l:char = get(ftmap, &filetype, '')
    return &readonly ? l:char : ''
endfunction

function! LightlinePercent() abort
    if winwidth(0) < 60
        return ''
    endif

    let l:percent = line('.') * 100 / line('$') . '%'
    return printf('%s', l:percent)
endfunction

function! LightlineFiletype() abort
    let l:icon = WebDevIconsGetFileTypeSymbol()
    return winwidth(0) > 86 ? (strlen(&filetype) ? &filetype . ' ' . l:icon . ' ' : l:icon) : ''
endfunction


function! LightlineLineinfo() abort
    if winwidth(0) < 86
        return ''
    endif

    let l:current_line = printf('%s', line('.'))
    let l:current_column = printf('%s', col('.'))
    let l:lineinfo = ' ' . l:current_line . ':' . l:current_column
    return l:lineinfo
endfunction

function! LightlineFilename() abort
    let ftmap = {
                \ 'nerdtree': '',
                \ 'fugitive': '',
                \ 'tagbar': ''
                \ }
    if &readonly
        let l:char = get(ftmap, &filetype, ' ')
    else
        let l:char = get(ftmap, &filetype, ' ')
    endif
    let l:maxlen = winwidth(0) - winwidth(0) / 2
    let l:relative = expand('%:.')
    let l:tail = expand('%:t')
    let l:noname = 'Empty Buffer'

    if winwidth(0) < 50
        return ''
    endif

    if winwidth(0) < 220
        return l:tail ==# '' ? l:noname : l:char . s:trim(l:maxlen, l:tail)
    endif

    return l:tail ==# '' ? l:noname : l:char . s:trim(l:maxlen, l:tail)
    "return l:relative ==# '' ? l:noname : l:char . s:trim(l:maxlen, l:relative)
endfunction

function! LightlineGitbranch() abort
    if exists('*fugitive#head')
        let maxlen = 15
        let branch = fugitive#head()
        return branch !=# '' ? ' '. s:trim(maxlen, branch) : ''
    endif
    return fugitive#head()
endfunction

