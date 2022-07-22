" Colors:
function! dp#get_palette()
    let palette = {
                \ 'bg':             ['#1E1E1E', 'NONE'],
                \ 'black0':         ['#3A3D41', 'NONE'],
                \ 'black1':         ['#2D2D2D', 'NONE'],
                \ 'black2':         ['#252526', 'NONE'],
                \ 'black3':         ['#222222', 'NONE'],
                \ 'fg':             ['#D4D4D4', 'NONE'],
                \ 'green0':         ['#4EC9B0', 'NONE'],
                \ 'green1':         ['#6A9955', 'NONE'],
                \ 'green2':         ['#4b5632', 'NONE'],
                \ 'green3':         ['#3f4531', 'NONE'],
                \ 'grey0':          ['#C6C6C6', 'NONE'],
                \ 'grey1':          ['#BBBBBB', 'NONE'],
                \ 'grey2':          ['#858585', 'NONE'],
                \ 'grey3':          ['#7F848E', 'NONE'],
                \ 'blue0':          ['#ADD6FF', 'NONE'],
                \ 'blue1':          ['#9CDCFE', 'NONE'],
                \ 'blue2':          ['#569CD6', 'NONE'],
                \ 'blue3':          ['#007ACC', 'NONE'],
                \ 'purple0':        ['#C586C0', 'NONE'],
                \ 'purple1':        ['#68217A', 'NONE'],
                \ 'red0':           ['#CE9178', 'NONE'],
                \ 'red1':           ['#6f1313', 'NONE'],
                \ 'red2':           ['#4b1818', 'NONE'],
                \ 'red3':           ['#331818', 'NONE'],
                \ 'yellow0':        ['#D18616', 'NONE'],
                \ 'yellow1':        ['#DCDCAA', 'NONE'],
                \ 'white':          ['#FFFFFF', 'NONE'],
                \ 'none':           ['NONE', 'NONE'],
                \ }
    return palette
endfunction

" Highlighter alias:
function dp#highlight(group, fg, bg, ...)
    execute 'highlight ' . a:group .
                \ ' guifg=' . a:fg[0] .
                \ ' guibg=' . a:bg[0] .
                \ ' ctermfg=' . a:fg[1] .
                \ ' ctermbg=' . a:bg[1] .
                \ ' gui=' . (a:0 >=1 ? a:1 : 'NONE') .
                \ ' cterm=' . (a:0 >=1 ? a:1 : 'NONE')
endfunction
