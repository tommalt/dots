highlight clear 

" for cterm, 'black' might get overwritten by the terminal emulator, so we use
" 232 (#080808), which is close enough.

highlight! Normal guibg=#ffffea guifg=#000000 ctermbg=230 ctermfg=232 
highlight! NonText guibg=bg guifg=#ffffea ctermbg=bg ctermfg=230
highlight! StatusLine guibg=#aeeeee guifg=#000000 gui=NONE ctermbg=159 ctermfg=232 cterm=NONE
highlight! StatusLineNC guibg=#eaffff guifg=#000000 gui=NONE ctermbg=194 ctermfg=232 cterm=NONE
highlight! WildMenu guibg=#000000 guifg=#eaffff gui=NONE ctermbg=black ctermfg=159 cterm=NONE
highlight! VertSplit guibg=#ffffea guifg=#000000 gui=NONE ctermbg=159 ctermfg=232 cterm=NONE
highlight! Folded guibg=#cccc7c guifg=fg ctermbg=187 ctermfg=fg
highlight! FoldColumn guibg=#fcfcce guifg=fg ctermbg=229 ctermfg=fg
highlight! Conceal guibg=bg guifg=fg gui=NONE ctermbg=bg ctermfg=fg cterm=NONE
highlight! LineNr guibg=bg guifg=#505050 ctermbg=bg ctermfg=239
highlight! Visual guibg=fg guifg=bg ctermbg=fg ctermfg=bg
highlight! CursorLine guibg=#ffffca guifg=fg ctermbg=230 ctermfg=fg

highlight! Statement guibg=bg guifg=fg ctermbg=bg ctermfg=fg
highlight! Identifier guibg=bg guifg=fg gui=bold ctermbg=bg ctermfg=fg
highlight! Type guibg=bg guifg=fg gui=bold ctermbg=bg ctermfg=fg
highlight! PreProc guibg=bg guifg=fg gui=bold ctermbg=bg ctermfg=fg
highlight! Constant guibg=bg guifg=#101010 gui=bold ctermbg=bg ctermfg=233
highlight! Comment guibg=bg guifg=#303030 ctermbg=bg ctermfg=236
highlight! Special guibg=bg guifg=fg gui=bold ctermbg=bg ctermfg=fg
highlight! SpecialKey guibg=bg guifg=fg gui=bold ctermbg=bg ctermfg=fg
highlight! Directory guibg=bg guifg=fg gui=bold ctermbg=bg ctermfg=fg
highlight! link Title Directory
highlight! link MoreMsg Comment
highlight! link Question Comment

" vim
hi link vimFunction Identifier

let g:colors_name = "acme"
