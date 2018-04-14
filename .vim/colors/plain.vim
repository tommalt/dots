" Plain old white colorscheme, for use with transparent terminal
" 255 = white
" 16  = black

highlight clear
if exists("syntax_on")
	syntax reset
endif
let g:colors_name = "plain"

hi LineNr       ctermfg=white
hi Search       ctermbg=DarkBlue ctermfg=White
hi StatusLine   ctermbg=16 ctermfg=255
hi StatusLineNC ctermbg=16 ctermfg=248
