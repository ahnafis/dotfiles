vim9script

import autoload "utils.vim"
import autoload "icons.vim"

def g:TabLine(): string
    var tabline = ""
    var buffer_modified_button = icons.Get("dot") .. " "

    for tab_nr in range(tabpagenr("$"))
        var selected_tab = tab_nr + 1
        var window_nr = tabpagewinnr(selected_tab)
        var buffer_list = tabpagebuflist(selected_tab)
        var buffer_nr = buffer_list[window_nr - 1]
        var buffer_name = bufname(buffer_list[window_nr - 1])
        var is_buffer_modified = getbufvar(buffer_nr, "&modified")
        var file_type = getbufvar(buffer_nr, "&filetype")

        # Enabling tabs to be grabbable by mouse
        tabline ..= $"%{selected_tab}T"

        if selected_tab == tabpagenr()
            tabline ..= "%#TabLineSel#"
        else
            tabline ..= "%#TabLine#"
        endif

        tabline ..= "  "

        if empty(buffer_name)
            tabline ..= "Untitled"

        # TODO: Refactor this.
        elseif file_type == "fugitive"
            tabline ..= "Fugitive"

        else
            tabline ..= fnamemodify(buffer_name, ":t")
        endif

        tabline ..= " "

        if is_buffer_modified
            tabline ..= buffer_modified_button
        endif

        tabline ..= " "
    endfor

    tabline ..= "%#TabLineFill#"
    return tabline
enddef

augroup setup_tab_line
    autocmd!
    autocmd BufEnter,BufWrite * set tabline=%!g:TabLine()
augroup END
