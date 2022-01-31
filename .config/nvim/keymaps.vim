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
nnoremap <leader>= <cmd>vertical resize +5<cr>
nnoremap <leader>- <cmd>vertical resize -5<cr>
nnoremap <leader>[ <cmd>resize +5<cr>
nnoremap <leader>] <cmd>resize -5<cr>

" Selection stuff
nnoremap <leader>a ggVG

" File navigation stiff
map <c-p> <cmd>W<cr>

" Line moving stuff
nnoremap <a-k> <cmd>m .-2<cr>==
inoremap <a-j> <esc><cmd>m .+1<cr>==gi
nnoremap <a-j> <cmd>m .+1<cr>==
inoremap <a-k> <esc><cmd>m .-2<cr>==gi
"vnoremap <a-j> <cmd>m '>+1<cr>gv=gv
"vnoremap <a-k> <cmd>m '<-2<cr>gv=gv


" COC: Jump to definition
nmap gd <cmd>call CocAction('jumpDefinition', 'drop')<cr>

" Commenting
nmap <C-_> <plug>NERDCommenterToggle
vmap <C-_> <plug>NERDCommenterToggle

