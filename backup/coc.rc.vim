" Extensions
"let g:coc_global_extensions = [
    "\ 'coc-marketplace',
    "\ 'coc-snippets',
    "\ 'coc-html-css-support',
    "\ 'coc-html',
    "\ 'coc-css',
    "\ 'coc-emmet',
    "\ 'coc-prettier',
    "\ 'coc-tsserver',
    "\ 'coc-json',
    "\ 'coc-jedi',
    "\ 'coc-sh',
    "\ 'coc-fish',
    "\ 'coc-highlight',
    "\ 'coc-lists'
    "\ ]

    "\ 'coc-git',


" Mappings
"nmap <leader>rn <Plug>(coc-rename)
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
""nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)
"nmap <leader>qf  <Plug>(coc-fix-current)
"nmap <silent> [g <Plug>(coc-diagnostic-prev)
"nmap <silent> ]g <Plug>(coc-diagnostic-next)
"nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<CR>
"nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<CR>
"
"" Highlight the symbol and its references when holding the cursor.
"autocmd CursorHold * silent call CocActionAsync('highlight')
"
"" Use K to show documentation in preview window.
"nnoremap <silent> K :call <SID>show_documentation()<CR>
"
"function! s:show_documentation()
"  if (index(['vim','help'], &filetype) >= 0)
"    execute 'h '.expand('<cword>')
"  elseif (coc#rpc#ready())
"    call CocActionAsync('doHover')
"  else
"    execute '!' . &keywordprg . " " . expand('<cword>')
"  endif
"endfunction
"
"" Coc marketplace
"nnoremap <C-S-e> <Cmd>CocList marketplace<CR>
""}}}
