vim9script noclear

g:file_types = {
  asm: "Assembly",
  c: "C",
  cpp: "C++",
  css: "CSS",
  html: "HTML",
  javascript: "JavaScript",
  javascriptreact: "JavaScript React",
  json: "JSON",
  jsonc: "JSON with Comments",
  php: "PHP",
  scss: "S(CSS)",
  typescript: "TypeScript",
  typescriptreact: "TypeScript React",
  vim: "Vim",
}

augroup setup_file_types
  autocmd!
  autocmd BufRead,BufNewFile coc-settings.json setlocal filetype=jsonc
  autocmd FileType c,cpp &l:commentstring = "// %s"
augroup END
