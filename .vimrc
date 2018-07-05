call pathogen#infect()

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = ''

" f1 for entire file, f2 for current selection/line
map <f1> :%pyf /usr/share/clang/clang-format.py<cr>
map <f2> :pyf /usr/share/clang/clang-format.py<cr>

filetype plugin on

" vim commentary C++ style comments
autocmd Filetype c,cpp,java setlocal commentstring=//\ %s

let mapleader = ","
let g:mapleader = ","

" :W sudo saves the file 
command W w !sudo tee % > /dev/null

set number
set ttyfast
set so=2        " buffer when scrolling
set lazyredraw

set splitbelow
set splitright

set wildmenu
set wildignore=*.o,*~,*.pyc,*.exe,*.so
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

if &term =~ '256color'
	set t_ut=
endif
" do not jump to the top of file when searching
set nowrapscan
set hlsearch

colorscheme blue
syntax on

set encoding=utf8
set ffs=unix,dos,mac
set nobackup
set nowb
set noswapfile

"tabs, whitespace, indents
set shiftwidth=8
set tabstop=8
set noexpandtab " do not expand tabs to spaces; use hard-tab

au! FileType python setl nosmartindent
au! FileType html setl shiftwidth=2 tabstop=2 expandtab
autocmd FileType haskell setl shiftwidth=8 tabstop=8 expandtab
autocmd FileType cabal setl shiftwidth=8 tabstop=8 expandtab
autocmd FileType scheme setl shiftwidth=2 tabstop=2 expandtab

"auto/smart indent
set ai
set si

" Visual mode pressing * searches for the current selection
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>

" changing windows like a human
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"buffers
map <leader>bd :Bclose<cr>
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>
"tabs
map <leader>tn :tabnew<cr>
map <leader>td :tabclose<cr>
map <leader>tl :tabp<cr>
map <leader>th :tabn<cr>

map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Always show the status line
set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ CWD:%r%{getcwd()}%h\ %l:%c

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

" Moving lines up or down with CTRL-SHIFT[k/j]
nnoremap <S-k> :m-2<CR>
nnoremap <S-j> :m+<CR>

map <leader>3<leader> i#include <><Esc>

" making file finding easier
set path+=**
" copy and paste
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<Esc>"+p
imap <C-v> <C-r><C-o>+

nnoremap <space> :

" emacs style EOL movement in insert mode
inoremap <C-a> <C-O>I
inoremap <C-e> <C-O>A

" CHICKEN scheme
let b:is_chicken=1

" golang no stupid red highlight
let g:go_highlight_trailing_whitespace_error=0
map <f6> :%!goimports
