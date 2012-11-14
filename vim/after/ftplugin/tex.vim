if has("gui_running")
    " remove the autocommands installed by live-latex-preview
    autocmd! CursorMoved
    autocmd! CursorMovedI
    autocmd! CursorHold
    autocmd! CursorHoldI
    " add an autocommand to save only when pressing enter
    au InsertLeave *.tex silent call UpdatePDF()
    au InsertEnter *.tex silent call UpdatePDF()
endif

nnoremap <silent> <buffer> <LocalLeader>h :silent! call system("xdotool key --window " . b:MuPDFWindowID . " h")<CR>
nnoremap <silent> <buffer> <LocalLeader>j :silent! call system("xdotool key --window " . b:MuPDFWindowID . " j")<CR>
nnoremap <silent> <buffer> <LocalLeader>k :silent! call system("xdotool key --window " . b:MuPDFWindowID . " k")<CR>
nnoremap <silent> <buffer> <LocalLeader>l :silent! call system("xdotool key --window " . b:MuPDFWindowID . " l")<CR>
nnoremap <silent> <buffer> <LocalLeader>R :silent! call system("xdotool key --window " . b:MuPDFWindowID . " r")<CR>
nnoremap <silent> <buffer> <LocalLeader><Space> :silent! call system("xdotool key --window " . b:MuPDFWindowID . " Space")<CR>
nnoremap <silent> <buffer> <LocalLeader><BS> :silent! call system("xdotool key --window " . b:MuPDFWindowID . " BackSpace")<CR>
nnoremap <silent> <buffer> <LocalLeader><Space> :silent! call system("xdotool key --window " . b:MuPDFWindowID . " Space")<CR>
nnoremap <silent> <buffer> <LocalLeader>W :silent! call system("xdotool key --window " . b:MuPDFWindowID . " W")<CR>
