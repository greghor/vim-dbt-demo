"Enable syntax highlighting, plugins
syntax on
filetype plugin indent on

set shell=bash
set term=screen-256color
set encoding=utf-8
set termencoding=utf-8

set showtabline=2
set cursorline
set hlsearch

set noswapfile
set clipboard=unnamedplus

set backspace=indent,eol,start
set tabstop=4
set shiftwidth=4
set expandtab


filetype plugin on
"*****************************************************************************
"" Vim-PLug core
"*****************************************************************************
if has('vim_starting')
    set nocompatible               " Be iMproved
endif

let g:vim_bootstrap_langs = "python"
let g:vim_bootstrap_editor = ""				" nvim or vim

" Required:
call plug#begin()

"*****************************************************************************
"" Plug install packages
"*****************************************************************************
Plug 'benmills/vimux'
Plug 'morhetz/gruvbox'      "gruvbox color scheme

call plug#end()

" Required:
filetype plugin indent on
"

"---------------------------------------
"Plugins configs
"----------------------------------------

"gruvbox
set background=dark
silent! colorscheme gruvbox


