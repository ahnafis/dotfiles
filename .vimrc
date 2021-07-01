set smartindent
set tabstop=4
set shiftwidth=4
set number
set textwidth=80
set autochdir
set laststatus=2
syntax on
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>


" PLUGINS
call plug#begin('~/.vim/plugged')

  Plug 'dense-analysis/ale'
  Plug 'preservim/nerdtree'
  Plug 'vim-scripts/indentpython.vim'
  Plug 'vim-syntastic/syntastic'
  Plug 'jistr/vim-nerdtree-tabs'

call plug#end()


" VIMSCRIPT 
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" STATUS LINE
set statusline=
set statusline+=\ %F\ %M\ %Y\ %R
set statusline+=\ percent:\ %p%%
set laststatus=2
