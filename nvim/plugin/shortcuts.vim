" Indent the current selected text
vnoremap <Tab> >gv

" Remove indent from current selected text
vnoremap <S-Tab> <gv

" Clear search
command! Cls :let @/ = ''

" Reload settings
command! RC :source $MYNVIMRC

" Copy/Paste from system clipboard
if g:os == 'mac'
    let copyCmd = 'pbcopy'
    let pastCmd = 'pbpaste'
else
    let copyCmd = 'xclip -in -selection clipboard'
    let pasteCmd = 'xclip -out -selection clipboard'
endif

vnoremap <silent> <leader>d d: call system(copyCmd, getreg('\"'))<CR>
vnoremap <silent> <leader>y y: call system(copyCmd, getreg("\""))<CR>
nnoremap <silent> <leader>p :call setreg("\"",system(pasteCmd))<CR>

" Move between wrapped lines
noremap j gj
noremap k gk
noremap <Up> gk
noremap <Down> gj

" Move a line of text using Alt+[jk]
nnoremap <A-j> mz:m+<cr>`z
nnoremap <A-k> mz:m-2<cr>`z
inoremap <A-j> <esc><A-j>
inoremap <A-k> <esc><A-k>
vnoremap <A-j> :m'>+<cr>`<my`>mzgv`yo`z
vnoremap <A-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Fix home and end keys on Mac keyboards
if g:os == 'mac'
    map <ESC>[H <Home>
    map <ESC>[F <End>
    imap <ESC>[H <C-O><Home>
    imap <ESC>[F <C-O><End>
    cmap <ESC>[H <Home>
    cmap <ESC>[F <End>
endif

" Add hex editing mode
command! -bar ToggleHexModeBE call ToggleHex(1)
command! -bar ToggleHexModeLE call ToggleHex(0)

function! ToggleHex(be)
    " Hex mode should be considered a read-only operation
    " Save values for modified and read-only for restoration later,
    " and clear the read-only flag for now
    let l:modified=&mod
    let l:oldreadonly=&readonly
    let &readonly=0
    let l:oldmodifiable=&modifiable
    let &modifiable=1

    if !exists("b:editHex") || !b:editHex
        " Save old options
        let b:oldft=&ft
        let b:oldbin=&bin

        " Set new options
        setlocal binary " Make sure it overrides any textwidth, etc
        silent :e " This will reload the file without trickeries

        let &ft="xxd"

        " Set status
        let b:editHex=1

        " Switch to hex editor
        if a:be == 1
            %!xxd -u
        else
            %!xxd -u -e
        endif
    else
        " Restore old options
        let &ft=b:oldft

        if !b:oldbin
            setlocal nobinary
        endif

        " Set status
        let b:editHex=0

        " Return to normal editing
        %!xxd -r
    endif

    " Restore values for modified and read-only state
    let &mod=l:modified
    let &readonly=l:oldreadonly
    let &modifiable=l:oldmodifiable
endfunction
