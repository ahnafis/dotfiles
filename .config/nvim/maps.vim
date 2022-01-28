" Set mapleader
let mapleader = ','

" Split navigation
nnoremap <C-h> <Cmd>wincmd h<Cr>
nnoremap <C-l> <Cmd>wincmd l<Cr>
nnoremap <C-k> <Cmd>wincmd k<Cr>
nnoremap <C-j> <Cmd>wincmd j<Cr>

" Toggle undotree
map <C-u> <Cmd>UndotreeToggle<Cr>

" Tab completion
inoremap <expr> <Tab> pumvisible() ? "\<C-n>": "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>": "\<S-Tab>"

" Resizing stuff
nnoremap <Leader>= <Cmd>vertical resize +5<Cr>
nnoremap <Leader>- <Cmd>vertical resize -5<Cr>
nnoremap <Leader>[ <Cmd>resize +5<Cr>
nnoremap <Leader>] <Cmd>resize -5<Cr>

" Selection stuff
nnoremap <Leader>a ggVG

" File navigation stiff
map <C-p> <Cmd>W<Cr>

" Line moving stuff
nnoremap <A-k> <Cmd>m .-2<CR>==
inoremap <A-j> <Esc><Cmd>m .+1<CR>==gi
nnoremap <A-j> <Cmd>m .+1<CR>==
inoremap <A-k> <Esc><Cmd>m .-2<CR>==gi
"vnoremap <A-j> <Cmd>m '>+1<CR>gv=gv
"vnoremap <A-k> <Cmd>m '<-2<CR>gv=gv


nmap <F2> :call CocAction('jumpDefinition', 'drop')<CR>
