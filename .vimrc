set nocompatible               " be iMproved

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
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'
Plug 'justinmk/vim-syntax-extra'
Plug 'vivien/vim-linux-coding-style'
"Plug 'nathanaelkane/vim-indent-guides'
"Plug 'scrooloose/syntastic'
"Plug 'Valloric/YouCompleteMe'
"Plug 'jakar/vim-AnsiEsc'
"Plug 'godlygeek/csapprox'
"Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/base16-vim'
"Plug 'guns/xterm-color-table.vim'
" Initialize plugin system
call plug#end()

let g:linuxsty_patterns = [ '/usr/src/linux', $HOME . '/Hacking/linux', $HOME . '/src/qsimu-linux/' ]

set background=dark
"colorscheme solarized
"colorscheme base16-default-dark
colorscheme base16-eighties

let g:indent_guides_auto_colors = has('gui_running')
let g:indent_guides_enable_on_vim_startup = has('gui_running')

