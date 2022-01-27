" Mapleader
let mapleader = " "

" Splitting
"nnoremap ,h :wincmd h <ESC> :sp 
"nnoremap ,l wincmd l <ESC> :sp 
"nnoremap ,k :wincmd k <ESC> :vs 
"nnoremap ,j :wincmd j <ESC> :vs 

" Split navigations
nnoremap <C-h> :wincmd h<CR>
nnoremap <C-l> :wincmd l<CR>
nnoremap <C-k> :wincmd k<CR>
nnoremap <C-j> :wincmd j<CR>

" Tab
nnoremap <C-T> :tabnew<CR>

" Tab navigations
"map <C-left> :tabp<CR>
map <C-right> :tabn<CR>
"map <C-TAB> :tabn<CR>
map <C-w> :tabclose<CR>

" Undotree
map <C-u> :UndotreeToggle<CR>

" Tab complete
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<Tab>"

" Commenting
nmap ;; <plug>NERDCommenterToggle
vmap ;; <plug>NERDCommenterToggle

" Resizing stuff
nnoremap ,= :vertical resize +5<CR>
nnoremap ,- :vertical resize -5<CR>
nnoremap ,] :resize +5<CR>
nnoremap ,[ :resize -5<CR>

" Editing stuff
"nnoremap <C-A> ggVG
nnoremap ,a ggVG

"map <C-e> :W<CR>
"map <C-e> :Files<CR>
map <C-p> :W<CR>
nmap <F8> :TagBar
map <C-e> :NERDTreeToggle<CR>

nmap <F2> :call CocAction('jumpDefinition', 'drop')<CR>

" Line moving stuff
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-k> <Esc>:m .-2<CR>==gi
inoremap <A-j> <Esc>:m .+1<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

