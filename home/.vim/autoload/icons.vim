vim9script

var icons = {
    dot: "\uf444",
    error: "",
    warning: ""
}

export def Get(icon_name: string): string
    return icons->get(icon_name, "")
enddef
