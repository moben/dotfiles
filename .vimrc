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
Plug 'tpope/vim-repeat'
"Plug 'jakar/vim-AnsiEsc'
"Plug 'godlygeek/csapprox'

Plug 'vivien/vim-linux-coding-style'
Plug 'sheerun/vim-polyglot'
Plug 'justinmk/vim-syntax-extra'
" Plug 'ludovicchabant/vim-gutentags'
Plug 'ctrlpvim/ctrlp.vim'
"Plug 'ajh17/VimCompletesMe'
Plug 'Shougo/neocomplete.vim'
"Plug 'vim-syntastic/syntastic'
Plug 'Chiel92/vim-autoformat'

"Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/base16-vim'
Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'morhetz/gruvbox'
" Plug 'itchyny/lightline.vim'
" Plug 'felixjung/vim-base16-lightline'
Plug 'mike-hearn/base16-vim-lightline'
" Plug 'shinchu/lightline-gruvbox.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'lifepillar/vim-cheat40'
Plug 'justinmk/vim-sneak'
Plug 'romainl/vim-qf'
Plug 'romainl/vim-qlist'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-sleuth'
"Plug 'guns/xterm-color-table.vim'
" Initialize plugin system
call plug#end()

" let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args = ['--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

let g:linuxsty_patterns = [ '/usr/src/linux', $HOME . '/Hacking/linux', $HOME . '/src/qsimu-linux/' ]

set termguicolors
set background=dark
let g:gruvbox_italic=1
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
   source ~/.vimrc_background
endif
let g:lightline = { 'colorscheme':  'base16_eighties', }

colorscheme dracula
let g:lightline = { 'colorscheme':  'dracula', }

set noshowmode
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
"let g:airline_extensions = []
"let g:airline_highlighting_cache = 1
"let g:airline_section_z = '[%L] %4l:%-2v'

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set guifont="Fira Mono Medium 11"

" Break and re-indent lines visually but not physically, with an indicator
set linebreak
set breakindent
set breakindentopt=sbr
set showbreak=┗━━━━▶

set listchars=tab:╰─,trail:·
set list

" Only capture stderr from :make and friends.
" Should avoid catching stuff like 'make: Makefile:1 rule failed' in quickfix
set shellpipe=2>
set wildmode=longest:full,full
" Makes <C-Left> and <C-Right> work in tmux/screen.
" Maybe this break when running vim in a vt?
set term=xterm

autocmd BufWritePre * if count(['c','cpp'],&filetype)
      \ | :Autoformat
      \ | endif

inoremap jj <ESC>
