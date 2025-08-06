vim9script

var icons = {
    vim: "\ue62b",
    dot: "\uf444",
    x_mark: "\uf467"
}

export def Get(icon_name: string): string
    return icons->get(icon_name, "")
enddef
