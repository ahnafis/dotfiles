" Set mapleader
let mapleader = ','

" Split navigation
nnoremap <c-h> <cmd>wincmd h<cr>
nnoremap <c-l> <cmd>wincmd l<cr>
nnoremap <c-k> <cmd>wincmd k<cr>
nnoremap <c-j> <cmd>wincmd j<cr>

" Toggle undotree
map <c-u> <cmd>UndotreeToggle<cr>

" Tab completion
inoremap <expr> <Tab> pumvisible() ? "\<c-n>": "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<c-p>": "\<S-Tab>"

" Resizing stuff
nnoremap <up> <cmd>resize +2<cr>
nnoremap <down> <cmd>resize -2<cr>
nnoremap <left> <cmd>vertical resize +2<cr>
nnoremap <right> <cmd>vertical resize -2<cr>

" Selection stuff
nnoremap <leader>a ggVG

" File navigation stiff
map <c-p> <cmd>W<cr>
map <c-e> <cmd>Lex<cr>

" Line moving stuff
nnoremap <a-k> <cmd>m .-2<cr>==
inoremap <a-j> <esc><cmd>m .+1<cr>==gi
nnoremap <a-j> <cmd>m .+1<cr>==
inoremap <a-k> <esc><cmd>m .-2<cr>==gi
"vnoremap <a-j> <cmd>m '>+1<cr>gv=gv
"vnoremap <a-k> <cmd>m '<-2<cr>gv=gv

" Commenting
nmap <C-_> <plug>NERDCommenterToggle
imap <C-_> <plug>NERDCommenterToggle
vmap <C-_> <plug>NERDCommenterToggle

