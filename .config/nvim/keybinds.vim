let mapleader = " "

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <space> za

" Tab
nnoremap <C-T> :tabnew<CR>

" Tab navigations
"map <C-left> :tabp<CR>
map <C-right> :tabn<CR>
"map <C-TAB> :tabn<CR>
map <C-w> :tabclose<CR>

" NvimTree toggling
"map <C-e> :NvimTreeToggle<CR>

" Undotree
map <C-u> :UndotreeToggle<CR>

" Tab complete
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<Tab>"

" Commenting
nmap <Leader>/ <plug>NERDCommenterToggle
vmap <Leader>/ <plug>NERDCommenterToggle

" Resizing stuff
nnoremap <Leader>= :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>

" Editing stuff
nnoremap <C-A> ggVG

"map <C-e> :W<CR>
map <C-e> :Files<CR>
map <C-p> :W<CR>
nmap <F8> :TagBar

nmap <F2> :call CocAction('jumpDefinition', 'drop')<CR>
