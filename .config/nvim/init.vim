" ---------------------------- [General settings] ---------------------------
filetype on
filetype plugin on
filetype indent on

syntax on
set termguicolors
set t_Co=256

set tabstop=8
autocmd BufNewFile,BufRead *.html,*.css,*.js,*.jsx,*.ts,*.tsx,*.json,*.c,*.cpp,*.h*,*.hpp setlocal softtabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.py,*.vim,*.lua,*.sh,*.bash,*.bashrc,*.fish setlocal softtabstop=4 shiftwidth=4
set expandtab
set autoindent
set smartindent
set copyindent

set number
set relativenumber
set noerrorbells
set noswapfile
set nobackup
set undofile
set undodir=~/.tmp/undodir
set clipboard=unnamedplus

set smartcase
set incsearch
set nohlsearch

set scrolloff=10
set splitbelow
set splitright
set signcolumn=number
set pumheight=10

"" Distraction free
"set laststatus=0

" ---------------------------- [General settings] ---------------------------

" -------------------------------- [Plugins] --------------------------------
let g:plug_home = stdpath('data') . '/plugged/'

call plug#begin()

" Colorscheme
Plug 'morhetz/gruvbox'
Plug 'sainnhe/sonokai'
Plug 'ayu-theme/ayu-vim'

" Utilities
Plug 'cohama/lexima.vim'
Plug 'mbbill/undotree'
"Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
"Plug 'glepnir/galaxyline.nvim'
Plug 'nvim-lualine/lualine.nvim'
"Plug 'itchyny/lightline.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'ryanoasis/vim-devicons'

" Syntax highlighting
Plug 'sheerun/vim-polyglot'

" LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
" -------------------------------- [Plugins] --------------------------------

" ---------------------------- [Plugin settings] ----------------------------
" Color scheme
set background=dark

let g:gruvbox_italic = 1
let g:gruvbox_bold = 0
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox

"let g:sonokai_style = 'shusia'
"colorscheme sonokai

"let g:lightline = {'colorscheme': colors_name}
lua require('lualine').setup()

" COC settings
let g:python_host_prog = 'python3'
let g:coc_global_extensions = [
    \ 'coc-marketplace',
    \ 'coc-snippets',
    \ 'coc-html-css-support',
    \ 'coc-html',
    \ 'coc-css',
    \ 'coc-emmet',
    \ 'coc-prettier',
    \ 'coc-tsserver',
    \ 'coc-json',
    \ 'coc-jedi',
    \ 'coc-sh',
    \ 'coc-fish',
    \ 'coc-highlight',
    \ 'coc-git',
    \ 'coc-lists'
    \ ]

" -------------------------- [Keyboard shortcuts] ---------------------------
" Set mapleader
let mapleader = ','

" Split navigation
nnoremap <C-h> <Cmd>wincmd h<CR>
nnoremap <C-l> <Cmd>wincmd l<CR>
nnoremap <C-k> <Cmd>wincmd k<CR>
nnoremap <C-j> <Cmd>wincmd j<CR>

" Toggle undotree
map <C-u> <Cmd>UndotreeToggle<CR>

" Tab completion
inoremap <expr> <Tab> pumvisible() ? "\<C-n>": "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>": "\<S-Tab>"

" Resizing stuff
nnoremap <Leader>= <Cmd>vertical resize +5<CR>
nnoremap <Leader>- <Cmd>vertical resize -5<CR>
nnoremap <Leader>[ <Cmd>resize +5<CR>
nnoremap <Leader>] <Cmd>resize -5<CR>

" Selection stuff
nnoremap <Leader>a ggVG
"inoremap <C-a> <Esc>ggVG

" File navigation stuff
map <C-p> <Cmd>Telescope find_files<CR>
map <C-e> <Cmd>NERDTreeToggle<CR>

" Line moving stuff
nnoremap <A-k> <Cmd>m .-2<CR>==
inoremap <A-j> <esc><Cmd>m .+1<CR>==gi
nnoremap <A-j> <Cmd>m .+1<CR>==
inoremap <A-k> <esc><Cmd>m .-2<CR>==gi
"vnoremap <A-j> <Cmd>m '>+1<CR>gv=gv
"vnoremap <A-k> <Cmd>m '<-2<CR>gv=gv

" Commenting
nmap <C-_> <plug>NERDCommenterToggle
vmap <C-_> <plug>NERDCommenterToggle

" Keymaps for distraction free mode
if &laststatus == 0
    nnoremap ++ <Cmd>echo &filetype<CR>
    nnoremap __ <Cmd>echo expand("%:r")<CR>
endif

" COC mappings {{{
nmap <leader>rn <Plug>(coc-rename)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<CR>
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<CR>

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Coc marketplace
nnoremap <C-S-e> <Cmd>CocList marketplace<CR>
"}}}
