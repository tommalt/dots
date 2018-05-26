" Vim filetype plugin file
" Language: Scheme (R7RS)
" Last Change: 2018-03-05
" Author: Evan Hanson <evhan@foldling.org>
" Maintainer: Evan Hanson <evhan@foldling.org>
" Previous Maintainer: Sergey Khorev <sergey.khorev@gmail.com>
" URL: https://foldling.org/vim/ftplugin/scheme.vim

if exists('b:did_ftplugin')
  finish
endif

let s:cpo = &cpo
set cpo&vim

setl lisp
setl comments=:;;;;,:;;;,:;;,:;,sr:#\|,mb:\|,ex:\|#
setl commentstring=;%s
setl define=^\\s*(def\\k*
setl iskeyword=33,35-39,42-43,45-58,60-90,94,95,97-122,126

let b:undo_ftplugin = 'setl lisp< comments< commentstring< define< iskeyword<'

setl lispwords=case
setl lispwords+=define
setl lispwords+=define-record-type
setl lispwords+=define-syntax
setl lispwords+=define-values
setl lispwords+=do
setl lispwords+=guard
setl lispwords+=lambda
setl lispwords+=let
setl lispwords+=let*
setl lispwords+=let*-values
setl lispwords+=let-syntax
setl lispwords+=let-values
setl lispwords+=letrec
setl lispwords+=letrec*
setl lispwords+=letrec-syntax
setl lispwords+=parameterize
setl lispwords+=set!
setl lispwords+=syntax-rules
setl lispwords+=unless
setl lispwords+=when

let b:undo_ftplugin = b:undo_ftplugin . ' lispwords<'

let b:did_scheme_ftplugin = 1

if exists('b:is_chicken') || exists('g:is_chicken')
  exe 'ru! ftplugin/chicken.vim'
endif

unlet b:did_scheme_ftplugin
let b:did_ftplugin = 1
let &cpo = s:cpo
unlet s:cpo


" CHICKEN
setl complete+=,k~/.chicken/scheme-word-list

" tell vim to search in (use) and (include) files for completions
setl include=\^\(\\(use\\\|require-extension\\)\\s\\+
setl includeexpr=substitute(v:fname,'$','.scm','')
setl path+=/usr/lib/chicken/8
setl suffixesadd=.scm

setl lispwords+=let-values,condition-case,with-input-from-string
setl lispwords+=with-output-to-string,handle-exceptions,call/cc,rec,receive
setl lispwords+=call-with-output-file

" use == to indent a sexp
nmap <silent> == :call Scheme_indent_top_sexp()<cr>
fun! Scheme_indent_top_sexp()
	let pos = getpos('.')
	silent! exec "normal! 99[(=%"
	call setpos('.', pos)
endfun
