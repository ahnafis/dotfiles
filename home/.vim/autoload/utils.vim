vim9script

import autoload "icons.vim"

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

export def CocDiagnostics(): string
    var info = b:->get("coc_diagnostic_info", {})
    var errors = info->get("error", 0)
    var warnings = info->get("warnings", 0)

    return $"{icons.Get("error")} {errors} {icons.Get("warning")} {warnings}"
enddef

export def GitBranch(): string
    var branch = system("git rev-parse --abbrev-ref HEAD")
    branch = branch->substitute("\n", "", "")

    var is_git_repo = matchstr(branch, "fatal") == ""

    if !is_git_repo
        branch = ""
    endif

    return branch
enddef
