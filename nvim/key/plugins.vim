" fzf
nnoremap <silent> <leader>g :Goyo<Cr>
"nnoremap <silent> // :BLines!<Cr>
nnoremap <silent> <leader>f :Files<Cr>
nnoremap <silent> / :BLines<Cr>

" Tagbar
nmap <silent> tb :TagbarToggle<Cr>
nmap <silent> tj :TagbarJumpNext<Cr>
nmap <silent> tk :TagbarJumpPrev<Cr>

" FIle ecplorer
nnoremap <silent> <leader>e :NERDTreeToggle<CR>

" Trouble
nnoremap <silent> <leader>x :TroubleToggle<CR>

" Preview LaTeX
nnoremap <leader>z :LLPStartPreview ./root.tex<CR>
