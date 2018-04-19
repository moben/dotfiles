set nocompatible               " be iMproved

set tabstop=2 shiftwidth=2 expandtab

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" My Plugins here:
" Make sure you use single quotes
Plug 'junegunn/vim-plug'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'
Plug 'justinmk/vim-syntax-extra'
"Plug 'scrooloose/syntastic'
"Plug 'Valloric/YouCompleteMe'
"Plug 'godlygeek/csapprox'
"Plug 'jakar/vim-AnsiEsc'
Plug 'nathanaelkane/vim-indent-guides'
"Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/base16-vim'
Plug 'guns/xterm-color-table.vim'
"Plug 'hg::https://bitbucket.org/abudden/taghighlight'
" Initialize plugin system
call plug#end()

syntax on

set background=dark
"colorscheme inkpot
"colorscheme solarized
"colorscheme base16-default-dark
colorscheme base16-eighties

set conceallevel=2
highlight Conceal guifg=white ctermfg=255

let g:indent_guides_auto_colors = has('gui_running')
let g:indent_guides_enable_on_vim_startup = has('gui_running')
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=233
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=234
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=0
"autocmd VimEnter,Colorscheme * :IndentGuidesEnable
"autocmd VimEnter * :AnsiEsc

let g:syntastic_c_checkers = ['ycm']
let g:syntastic_cpp_checkers = ['ycm']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_error_symbol='✗'                                                                                                                                             
let g:syntastic_warning_symbol='⚠'

if exists('g:vimpager.enabled')
  let g:vimpager.X11 = 0
endif
