" 256 noir. Basically: dark background, numerals & errors red,
" rest different shades of gray.
" colors 232--250 are shades of gray, from dark to light;
" 16=black, 255=white, 196=red, 88=darkred.
" 18=DarkBlue, 
set background=dark
highlight clear
if exists("syntax_on")
	syntax reset
endif
let g:colors_name = "black_white"

hi Normal          ctermbg=16     ctermfg=252
hi Boolean         ctermbg=16     ctermfg=255
hi Character       ctermbg=16     ctermfg=196
hi Comment         ctermbg=16     ctermfg=255
hi Condtional      ctermbg=16     ctermfg=196
hi Constant        ctermbg=16     ctermfg=255
hi Cursor          ctermbg=255    ctermfg=16
hi ColorColumn     ctermbg=255    ctermfg=16
hi CursorColumn    ctermbg=255    ctermfg=16
hi Debug           ctermbg=16     ctermfg=255
hi Define          ctermbg=16     ctermfg=255
hi Delimiter       ctermbg=16     ctermfg=255
hi Directory       ctermbg=16     ctermfg=255
hi Error           ctermbg=88     ctermfg=255
hi Exception       ctermbg=16     ctermfg=255
hi Float           ctermbg=16     ctermfg=196
hi FoldColumn      ctermbg=16     ctermfg=255
hi Folded          ctermbg=16     ctermfg=196
hi Function        ctermbg=16     ctermfg=255
hi Identifier      ctermbg=16     ctermfg=255
hi Include         ctermbg=16     ctermfg=255
hi Keyword         ctermbg=16     ctermfg=255
hi Label           ctermbg=16     ctermfg=255
hi LineNr          ctermbg=16     ctermfg=8
hi MatchParen      ctermbg=255    ctermfg=16
hi Macro           ctermbg=16     ctermfg=255
hi ModeMsg         ctermbg=16     ctermfg=255
hi MoreMsg         ctermbg=16     ctermfg=255
hi NonText         ctermbg=16     ctermfg=255
hi Number          ctermbg=16     ctermfg=196
hi Operator        ctermbg=16     ctermfg=255
hi Pmenu           ctermbg=255    ctermfg=8
hi PmenuSel        ctermbg=252    ctermfg=16
hi PmenuSbar       ctermbg=255    ctermfg=16
hi PmenuThumb      ctermbg=196    ctermfg=255
hi PreCondit       ctermbg=16     ctermfg=255
hi PreProc         ctermbg=16     ctermfg=255
hi Question        ctermbg=16     ctermfg=255
hi Repeat          ctermbg=16     ctermfg=255
hi Search          ctermbg=16     ctermfg=160
hi SpecialChar     ctermbg=16     ctermfg=255
hi SpecialComment  ctermbg=16     ctermfg=255
hi Special         ctermbg=16     ctermfg=255
hi SpecialKey      ctermbg=255    ctermfg=16
hi Statement       ctermbg=16     ctermfg=255
hi StatusLine      ctermbg=255    ctermfg=196
hi StatusLineNC    ctermbg=16     ctermfg=255
hi StorageClass    ctermbg=16     ctermfg=255
hi String          ctermbg=16     ctermfg=255
hi Structure       ctermbg=16     ctermfg=255
hi Tag             ctermbg=16     ctermfg=196
hi Title           ctermbg=16     ctermfg=255
hi Todo            ctermbg=16     ctermfg=255
hi Typedef         ctermbg=16     ctermfg=255
hi Type            ctermbg=16     ctermfg=255
hi VertSplit       ctermbg=16     ctermfg=255
hi WarningMsg      ctermbg=16     ctermfg=196
hi WildMenu        ctermbg=255    ctermfg=16
hi Visual          ctermbg=255    ctermfg=16
hi VisualNOS       ctermbg=255    ctermfg=16
hi IncSearch       ctermbg=255    ctermfg=255
"hi Search          ctermbg=255    ctermfg=255
hi Search          ctermbg=DarkBlue     ctermfg=White
hi ErrorMsg        ctermbg=124    ctermfg=255
hi SpellBad        ctermbg=88     ctermfg=255
hi SpellCap        ctermbg=124    ctermfg=255
hi SpellLocal      ctermbg=124    ctermfg=255
hi SpellRare       ctermbg=16     ctermfg=124

hi DiffAdd         ctermbg=16     ctermfg=255
hi DiffChange      ctermbg=255    ctermfg=160
hi DiffDelete      ctermbg=16     ctermfg=255
hi DiffText        ctermbg=196    ctermfg=255
hi def link diffCommon          Statement
hi def link diffRemoved         DiffDelete
hi def link diffChanged         DiffChange
hi def link diffAdded           DiffAdd

