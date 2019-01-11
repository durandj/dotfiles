let g:lightline = {
    \ 'colorscheme': 'solarized',
    \ 'active': {
        \ 'left': [
            \ ['mode', 'paste'],
            \ ['fugitive', 'filename'],
        \ ],
        \ 'right': [
            \ ['syntastic', 'lineinfo'],
            \ ['percent'],
            \ ['fileformat', 'fileencoding', 'filetype'],
        \ ],
    \ },
    \ 'component_function': {
        \ 'fileencoding': 'LightLineFileencoding',
        \ 'fileformat': 'LightLineFileFormat',
        \ 'filename': 'LightLineFilename',
        \ 'filetype': 'LightLineFiletype',
        \ 'fugitive': 'LightLineFugitive',
        \ 'mode': 'LightLineMode',
    \ },
    \ 'component_expand': {
        \ 'syntastic': 'SyntasticStatuslineFlag',
    \ },
    \ 'component_type': {
        \ 'syntastic': 'error',
    \ },
    \ 'separator': {'left': '', 'right': ''},
    \ 'subseparator': {'left': '', 'right': ''},
\ }

function! LightLineFileencoding()
    return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineFileformat()
    return winwidth(0) > 70 ?
        \ (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! LightLineFilename()
    let fname = expand('%:t')

    return fname =~ 'NERD_tree' ? '' :
        \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ?
        \ &filetype . ' ' . WebDevIconsGetFileTypeSymbol() :
        \ 'no ft') : ''
endfunction

function! LightLineFugitive()
    try
        if expand('%:t') !~? 'NERD' && exists('*fugitive#head')
            let mark = ''
            let _ = fugitive#head()

            return strlen(_) ? mark._ : ''
        endif
    catch
    endtry

    return ''
endfunction

function! LightLineMode()
    let fname = expand('%:t')

    return fname =~ 'NERD_tree' ? 'NERDTree' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! LightLineModified()
    if &filetype == "help"
        return ""
    elseif &modified
        return "+"
    elseif &modifiable
        return ""
    else
        return ""
    endif
endfunction

function! LightLineReadonly()
    if &filetype == "help"
        return ""
    elseif &readonly
        return "⭤"
    else
        return ""
    endif
endfunction
