set go-=M

filetype on
filetype plugin indent on
syntax on

set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set softtabstop=4
set autoindent
set number

set backup
set backupdir=~/.vim/backup

" MacVim key re-mappings
imap <D-j> <Plug>IMAP_JumpForward

" MacVim Latex Suite settings
" REQUIRED: This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
"set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults
" to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" Has to do with the pdf open application
let g:Tex_ViewRule_pdf = 'Skim'

" this is mostly a matter of taste. but LaTeX looks good with just a bit
" of indentation.
"set sw=2

" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
set iskeyword+=:

" Always compile pdfs twice (to get references right)
let g:Tex_MultipleCompileFormats = 'dvi, pdf'

" Add the '-synctex' option to the compile line
let g:Tex_CompileRule_pdf = 'pdflatex -interaction=nonstopmode -synctex=1 -shell-escape $*'

" I don't know exactly if this does anything
let g:TreatMacViewerAsUNIX = 1

" Ignore any makefiles present in the current directory
let Tex_UseMakefile = 0

" Don't automatically jump to the first warning/error
let g:Tex_GotoError = 0

" Don't show menus
let g:Tex_Menus = 0

" minibufexplorer options
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" change directory to current file
nnoremap <Leader>cd :cd %:p:h<CR>:pwd<CR>

" colorscheme set to default
set t_Co=256
colorscheme default

" ctags for latex
let tlist_tex_settings   = 'latex;s:sections;g:graphics;l:labels'
let tlist_make_settings  = 'make;m:makros;t:targets'


" Mappings to access buffers (don't use "\p" because a
" delay before pressing "p" would accidentally paste).
" \l       : list buffers
" \b \f \g : go back/forward/last-used
" \1 \2 \3 : go to buffer 1/2/3 etc
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>

" to fix the backspace
set backspace=2

" for pasting in the terminal
nnoremap <F4> :set invpaste paste?<CR>
set pastetoggle=<F4>
set showmode

" commands to modify selected text to display with fancy lines
" modify selected text using combining diacritics
command! -range -nargs=0 Overline        call s:CombineSelection(<line1>, <line2>, '0305')
command! -range -nargs=0 Underline       call s:CombineSelection(<line1>, <line2>, '0332')
command! -range -nargs=0 DoubleUnderline call s:CombineSelection(<line1>, <line2>, '0333')
command! -range -nargs=0 Strikethrough   call s:CombineSelection(<line1>, <line2>, '0336')

function! s:CombineSelection(line1, line2, cp)
  execute 'let char = "\u'.a:cp.'"'
  execute a:line1.','.a:line2.'s/\%V[^[:cntrl:]]/&'.char.'/ge'
endfunction

" toggle line numbers in order to make it easier to copy to other places
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>

" for pydoc
let g:pydoc_open_cmd='vsplit'

" set modeline
cmap w!! %!sudo tee > /dev/null %

" this is a test
