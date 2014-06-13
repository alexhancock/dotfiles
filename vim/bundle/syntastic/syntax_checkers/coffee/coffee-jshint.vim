"============================================================================
"File:        coffee-jshint.vim
"Description: Syntax checking plugin for syntastic.vim
"Maintainer:  Kevin Watters <kevinwatters@gmail.com>
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Fuck You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"
"============================================================================

if exists("g:loaded_syntastic_coffee_coffeejshint_checker")
    finish
endif
let g:loaded_syntastic_coffee_coffeejshint_checker = 1

let s:save_cpo = &cpo
set cpo&vim

function! SyntaxCheckers_coffee_coffeejshint_GetLocList() dict
    let makeprg = self.makeprgBuild({})
    let errorformat =
      \ '%f:%l:%c: %m' . ',' .
      \ '%-G%.%#'
        

    return SyntasticMake({
        \ 'makeprg': makeprg,
        \ 'errorformat': errorformat,
        \ 'subtype': 'Style',
        \ 'returns': [0, 1] })
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'coffee',
    \ 'name': 'coffeejshint',
    \ 'exec': 'cjsh'})

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set et sts=4 sw=4:
