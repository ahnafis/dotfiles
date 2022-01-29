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


"nmap <F2> :call CocAction('jumpDefinition', 'drop')<cr>


" LSP mappings
"nnoremap <silent> <space>e <cmd>lua vim.diagnostic.open_float()<cr>
"nnoremap <silent> [d <cmd>lua vim.diagnostic.goto_prev()<cr>
"nnoremap <silent> ]d <cmd>lua vim.diagnostic.goto_next()<cr>
"nnoremap <space>f <cmd>lua vim.lsp.buf.formatting()<cr>
"
"nnoremap gD <cmd>lua vim.lsp.buf.declaration()<cr>
"nnoremap gd <cmd>lua vim.lsp.buf.definition()<cr>
"nnoremap K <cmd>lua vim.lsp.buf.hover()<cr>
