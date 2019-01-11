set number                           " Turn on line numbers
set backupskip=/tmp/*,/private/tmp/* " Skip backup files for some directories
set fileformats=unix,mac,dos         " Set file endings based on file
" The following two options work in tandem to ignore case when searching if
" the search query has only lowercase letters.
set ignorecase                       " Ignore case when searching
set smartcase                        " Do case insensitive search when all lowercase
set incsearch                        " Enables incremental search
set laststatus=2                     " Always show the status bar
set list                             " Show invisible characters
" Set the characters to use for invisible characters
set listchars=eol:¬,tab:▸\ ,space:•,extends:→,precedes:←
set expandtab                        " Expand tabs to spaces
set shiftwidth=4                     " Set the number of spaces in a tab
set tabstop=4                        " Set the visible width of a tab
set autoindent                       " Handle indentation automatically
set smartindent                      " Adds more intelligent rules to indentation
set scrolloff=2                      " Keep extra lines visible when scrolling
set wildignorecase                   " Ignore case when completing file names
set colorcolumn=70,80,100,120        " Set additional colored columns

" Make trailing whitespace annoyingly highlighted.
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Kill all trailing whitespace on save
autocmd FileType vim,perl,c,cpp,python,ruby,java,js,jsx,css
    \ autocmd BufWritePre <buffer> :%s/\s\+$//e
