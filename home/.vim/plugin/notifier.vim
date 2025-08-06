vim9script noclear

import autoload "utils.vim"

# FIXME: Plugin reload.
# TODO: Add icons.
# TODO: Add warning and error notifiers.

if utils.IsLoaded("notifier")
    finish
endif
g:loaded_notifier = true

const DEFAULT_SETTINGS = {
    opts: {
        pos: "botright",
        zindex: 10000,
        time: 5000,
        col: &columns,
        line: &lines - 2,
        close: 'click',
        padding: [0, 1, 0, 1],
        maxwidth: 30,
        maxheight: 3,
        minwidth: 30,
        minheight: 3,
    }
}

def Notify(message: string): void
    popup_create(message, DEFAULT_SETTINGS.opts)
enddef

command! -nargs=1 Notify Notify(<args>)
