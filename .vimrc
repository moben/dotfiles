set nocompatible               " be iMproved

" set this here so project specific configs can override it later
set tabstop=4 shiftwidth=4 expandtab

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
Plug 'Shougo/vimproc.vim', { 'do': ':VimProcInstall' } " for neocomplete (optional)
"Plug 'jakar/vim-AnsiEsc'
"Plug 'godlygeek/csapprox'

Plug 'vivien/vim-linux-coding-style'
Plug 'sheerun/vim-polyglot'
Plug 'justinmk/vim-syntax-extra'
"Plug 'ludovicchabant/vim-gutentags'
"Plug 'ajh17/VimCompletesMe'
Plug 'Shougo/neocomplete.vim'
"Plug 'vim-syntastic/syntastic'

"Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/base16-vim'
Plug 'itchyny/lightline.vim'
Plug 'felixjung/vim-base16-lightline'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

Plug 'lifepillar/vim-cheat40'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'
"Plug 'guns/xterm-color-table.vim'
" Initialize plugin system
call plug#end()


let g:linuxsty_patterns = [ '/usr/src/linux', $HOME . '/Hacking/linux', $HOME . '/src/qsimu-linux/' ]


" needed for correct colors with base16-shell
let base16colorspace=256
set background=dark
"colorscheme solarized
colorscheme base16-eighties
let g:lightline = { 'colorscheme': 'base16_eighties', }
set noshowmode
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
"let g:airline_extensions = []
"let g:airline_highlighting_cache = 1
"let g:airline_section_z = '[%L] %4l:%-2v'


set wildmode=longest:full,full
" Makes <C-Left> and <C-Right> work in tmux/screen.
" Maybe this break when running vim in a vt?
set term=xterm

