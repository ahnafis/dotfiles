## General Settings
set number
set smartindent
set tabstop=4
set shiftwidth=4
set textwidth=80
set autochdir
set laststatus=2
set encoding=utf-8

## Plugins
call plug#begin('~/.config/nvim/plugged')
  Plug 'jiangmiao/auto-pairs'
  Plug 'itchyny/lightline.vim'
  Plug 'preservim/nerdtree'
call plug#end()
