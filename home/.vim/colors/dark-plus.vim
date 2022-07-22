" -----------------------------------------------------------------------------
" Name:         VSCode Dark+ Pro
" Author:       Ahnaf Al Nafis <ahnafalnafis@gmail.com>
" -----------------------------------------------------------------------------

" Colors:
let s:palette = dp#get_palette()

if !(exists('g:colors_name') && g:colors_name ==# 'dark-plus')
   highlight clear
   if exists('syntax_on')
      syntax reset
   endif
endif
let g:colors_name = 'dark-plus'

call dp#highlight('Normal', s:palette.fg, s:palette.bg)

" Comments:
if !exists('g:dp_default_comment')
   let g:dp_default_comment = 1
endif

if g:dp_default_comment
   call dp#highlight('Comment', s:palette.green1, s:palette.none)
   call dp#highlight('vimCommentTitle', s:palette.green1, s:palette.none, 'bold')
else
   call dp#highlight('Comment', s:palette.grey3, s:palette.none)
   call dp#highlight('vimCommentTitle', s:palette.grey3, s:palette.none, 'bold')
endif

" Spell checker:
call dp#highlight('SpellBad', s:palette.none, s:palette.none, 'undercurl')
call dp#highlight('SpellLocal', s:palette.none, s:palette.none, 'undercurl')
call dp#highlight('SpellRare', s:palette.none, s:palette.none, 'undercurl')
call dp#highlight('SpellCap', s:palette.none, s:palette.none, 'undercurl')

" Line numbers:
call dp#highlight('LineNr', s:palette.grey2, s:palette.none)
if &diff
   call dp#highlight('CursorLineNr', s:palette.grey0, s:palette.none, 'underline')
else
   call dp#highlight('CursorLineNr', s:palette.grey0, s:palette.none)
endif

" Columns and rows:
call dp#highlight('SignColumn', s:palette.none, s:palette.bg)
if &diff
   call dp#highlight('CursorLine', s:palette.none, s:palette.none, 'underline')
   call dp#highlight('CursorColumn', s:palette.none, s:palette.none, 'bold')
else
   call dp#highlight('CursorLine', s:palette.none, s:palette.black3)
   call dp#highlight('CursorColumn', s:palette.none, s:palette.none)
endif

" Initials:
call dp#highlight('Type', s:palette.green0, s:palette.none)
call dp#highlight('Function', s:palette.yellow1, s:palette.none)
call dp#highlight('Identifier', s:palette.blue1, s:palette.none, 'none')
call dp#highlight('PreProc', s:palette.blue1, s:palette.none)

" Constants:
call dp#highlight('Constant', s:palette.blue2, s:palette.none)
call dp#highlight('String', s:palette.red0, s:palette.none)

call dp#highlight('Statement', s:palette.purple0, s:palette.none)

" Tab line:
" highlight! link TabLineSel Normal
call dp#highlight('TabLine', s:palette.none, s:palette.black1)
call dp#highlight('TabLineSel', s:palette.fg, s:palette.bg, 'bold')
call dp#highlight('TabLineFill', s:palette.none, s:palette.black2)

" Status line:
if !exists('g:dp_default_statusline')
   let g:dp_default_statusline = 1
endif
if !exists('g:dp_statusline_reverse')
   let g:dp_statusline_reverse = 0
endif
if !exists('g:dp_statusline_one_color')
   let g:dp_statusline_one_color = ''
endif

if g:dp_default_statusline
   if len(argv()) >=1
      for dir in argv()
         if isdirectory(dir)
            if g:dp_statusline_reverse
               call dp#highlight('StatusLine', s:palette.white, s:palette.purple1)
            else
               call dp#highlight('StatusLine', s:palette.white, s:palette.blue3)
            endif

         else
            if g:dp_statusline_reverse
               call dp#highlight('StatusLine', s:palette.white, s:palette.blue3)
            else
               call dp#highlight('StatusLine', s:palette.white, s:palette.purple1)
            endif
         endif
      endfor
   endif

else
   if g:dp_statusline_one_color ==# 'blue'
      call dp#highlight('StatusLine', s:palette.white, s:palette.blue3)
   elseif g:dp_statusline_one_color ==# 'purple'
      call dp#highlight('StatusLine', s:palette.white, s:palette.purple1)
   else
      highlight! link StatusLine TabLineFill
   endif
endif

" Diff:
call dp#highlight('DiffAdd', s:palette.none, s:palette.green2)
call dp#highlight('DiffDelete', s:palette.none, s:palette.red1)
call dp#highlight('DiffChange', s:palette.none, s:palette.red2)
call dp#highlight('DiffText', s:palette.none, s:palette.green2)

" TODO: DIRECTORY
" COC highlights:
call dp#highlight("CocErrorHighlight", s:palette.none, s:palette.none, "undercurl")

" File type specific highlight rules:
" Vim: 
call dp#highlight('vimOption', s:palette.green0, s:palette.none)

" JavaScript:
hi! link javascriptKeyword Keyword
