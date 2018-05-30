" NetBSD colorscheme

set background=dark
highlight clear
if exists("syntax_on")
	syntax reset
endif
let g:colors_name = "netbsd"

hi LineNr ctermfg=214
hi Search ctermbg=214 ctermfg=0
hi Cursor ctermbg=214 ctermfg=0
