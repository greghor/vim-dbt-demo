
filetype plugin on
"*****************************************************************************
"" Vim-PLug core
"*****************************************************************************
if has('vim_starting')
    set nocompatible               " Be iMproved
endif

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
"*****************************************************************************
"" Functions
"*****************************************************************************

function! ExecuteDbtCommand(command)
    :w
    let buf = bufname()
    let model = split(split(buf, "/")[-1], '\.')[0]
    let dbt_command = "dbt " . a:command . " -s " . model
    VimuxRunCommand(dbt_command)
endfunction

function! OpenDbtCompile()
    call ExecuteDbtCommand("compile")
    let model_path = bufname()
    let project_name = substitute(split(getcwd(), "/")[-1], "-", "_", "")
    let compiled_model_path = "target/compiled/" . project_name . "/" . model_path
    execute 'edit' compiled_model_path
endfunction

"*****************************************************************************
"" Mappings
"*****************************************************************************


nnoremap ,dr :call ExecuteDbtCommand("run")<CR>
nnoremap ,dt :call ExecuteDbtCommand("test")<CR>
nnoremap ,dc :call ExecuteDbtCommand("compile")<CR>
nnoremap ,do :call OpenDbtCompile()<CR>
nnoremap ,drp :call ExecuteDbtCommand("run --target prod")<CR>
nnoremap ,dtp :call ExecuteDbtCommand("test --target prod")<CR>
nnoremap ,dcp :call ExecuteDbtCommand("compile --target prod")<CR>

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary
set relativenumber
set ttyfast

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overriten by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab


"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax on
set ruler
set number

"gruvbox
set background=dark
silent! colorscheme gruvbox
  

"" Status bar
set laststatus=2



