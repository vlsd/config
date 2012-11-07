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
set background=dark
highlight Normal guibg=Grey12 guifg=White
set guioptions-=T   " don't display that useless toolbar in gvim

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

