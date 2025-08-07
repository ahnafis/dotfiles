vim9script

export def IsLoaded(plugin_name: string): bool
    var plugin = $"loaded_{plugin_name}"
    return g:->get(plugin, false)
enddef

def IsCocLoaded(): bool
    return g:->get("did_coc_loaded", false)
enddef

export def GetFileType(file_type: string): string
    return g:file_types->get(file_type, &filetype)
enddef

export def OnTab(): string
    if IsCocLoaded() && coc#pum#visible()
        return coc#pum#next(1)
    elseif pumvisible()
        return "\<C-n>"
    endif

    return "\<Tab>"
enddef

export def OnShiftTab(): string
    if IsCocLoaded() && coc#pum#visible()
        return coc#pum#prev(1)
    elseif pumvisible()
        return "\<C-p>"
    endif

    return "\<S-Tab>"
enddef

export def OnEnter(): string
    if IsCocLoaded()
        if coc#pum#visible()
            return coc#pum#confirm()
        else
            return "\<C-g>u\<CR>\<C-r>=coc#on_enter()\<CR>"
        endif
    elseif pumvisible()
        return "\<C-y>"
    endif

    return "\<Enter>"
enddef

export def ShowDocumentation(): void
    if g:CocAction("hasProvider", "hover")
        g:CocActionAsync("doHover")
    else
        feedkeys('K', "in")
    endif
enddef

export def ScrollDocumentationNext(): string
    if coc#float#has_scroll()
        return coc#float#scroll(1)
    endif

    return "\<C-f>"
enddef

export def ScrollDocumentationPrev(): string
    if coc#float#has_scroll()
        return coc#float#scroll(0)
    endif

    return "\<C-b>"
enddef
