" Disable all VI compatibility
set nocompatible

" Set the root path to the NeoVim configs
let g:nvim_root = '~/.config/nvim'

function! Trim(input_string)
    return substitute(a:input_string, '^\s*\(.\{-}\)[\s\n]*$', '\1', '')
endfunction

" Determine general operating system type that this is running on
let g:os = 'unknown'
let s:uname = Trim(system('uname'))
if s:uname == 'Linux'
    let g:os = 'linux'
elseif s:uname == 'Darwin'
    let g:os = 'mac'
endif

"
" Setup plugins
"
call plug#begin(g:nvim_root . '/plugged')
Plug 'itchyny/lightline.vim'                       " Adds a better status line
Plug 'sheerun/vim-polyglot'                        " Provides syntax highlighting for many languages
Plug 'flazz/vim-colorschemes'                      " Provides multiple themes
Plug 'scrooloose/nerdtree'                         " File explorer tree view
Plug 'Xuyuanp/nerdtree-git-plugin'                 " Adds Git information to NerdTree
Plug 'ryanoasis/vim-devicons'                      " File icons to use in NerdTree
Plug 'tpope/vim-fugitive'                          " Adds additional Git support
Plug 'fholgado/minibufexpl.vim'                    " Adds a buffer explorer to show open files
Plug 'scrooloose/nerdcommenter'                    " Adds multilanguage comment support
Plug 'w0rp/ale'                                    " Adds async linting support
Plug 'airblade/vim-gitgutter'                      " Adds Git symbols to the gutter
Plug 'ivyl/vim-bling'                              " Makes the search cursor blink
Plug 'Valloric/YouCompleteMe'                      " Code completion
Plug 'editorconfig/editorconfig-vim'               " Support for editorconfig
Plug 'ludovicchabant/vim-gutentags'                " Handles tag generation and maintenance
Plug 'majutsushi/tagbar'                           " Adds a sidebar containing tag information
Plug 'junegunn/fzf'                                " Fuzzy finder core library
Plug 'junegunn/fzf.vim'                            " Fuzzy finder integration for vim
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " Better Golang support
Plug 'mdempsky/gocode', {
    \ 'rtp': 'vim',
    \ 'do': '~/.config/nvim/plugged/gocode/vim/symlink.sh'
\ }
call plug#end()

"
" Set theme
"
syntax on
set background=dark
silent! colorscheme solarized
