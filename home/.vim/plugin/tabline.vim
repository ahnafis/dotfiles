vim9script 

import autoload "utils.vim"
import autoload "icons.vim"

if utils.IsLoaded("tabline")
  finish
endif

g:loaded_tabline = true
g:buffer_modified_button = icons.Get("dot") .. " "
g:tab_close_button = icons.Get("x_mark") .. " "

def g:TabLine(): string
  var tabline = ""

  for i in range(tabpagenr("$"))
    var selected_tab = i + 1
    var window_nr = tabpagewinnr(selected_tab)
    var buffer_list = tabpagebuflist(selected_tab)
    var buffer_nr = buffer_list[window_nr - 1]
    var buffer_name = bufname(buffer_list[window_nr - 1])
    var is_buffer_modified = getbufvar(buffer_nr, "&modified")
    var buffer_icon = icons.Get(getbufvar(buffer_nr, "&filetype"))

    # Enabling tabs to be grabbable by mouse
    tabline ..= $"%{selected_tab}T"

    tabline ..= (selected_tab == tabpagenr() ? "%#TabLineSel#" : "%#TabLine#")
    tabline ..= "  "

    tabline ..= buffer_icon
    if !empty(buffer_icon)
      tabline ..= " "
    endif

    tabline ..= (empty(buffer_name) ? "Untitled" : fnamemodify(buffer_name, ":t"))
    tabline ..= " "

    if is_buffer_modified 
      tabline ..= g:buffer_modified_button
    # else
    #   tabline ..= $"%999X{g:tab_close_button}"
    endif

    tabline ..= " "
    tabline ..= "%#TabLineFill#"
  endfor

  return tabline
enddef



augroup setup_tab_line
  autocmd!
  autocmd BufEnter,BufWrite * set tabline=%!g:TabLine()
  autocmd filetypedetect FileType * set tabline=%!g:TabLine()
augroup END
