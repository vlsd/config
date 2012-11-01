" actionscript filetype
if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufRead,BufNewFile *.as       setfiletype actionscript
  au! BufRead,BufNewFile *.m      set ft=mma sw=2
augroup END

