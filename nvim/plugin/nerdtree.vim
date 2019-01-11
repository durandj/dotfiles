noremap <F6> :NERDTreeToggle<CR>

" Automatically open up NerdTree if NeoVim is opened with no files
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
