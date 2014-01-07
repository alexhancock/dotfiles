" Vim syntax file (works in vim73)
" Based off of https://gist.github.com/MSch/1062382
" Language:	Tagged JST
" Maintainer:	Tyson Andre <tandre@tagged.com>
" Version:	3
" Last Change:  2013 May 9, 2013
" Place in .vim/syntax/jst.vim and add this line to vimrc
" au BufNewFile,BufRead *.jst set filetype=jst
 
runtime! syntax/html.vim
unlet b:current_syntax
 
if exists("b:current_syntax")
  finish
endif

" " The starting version would just be
" syn region jstBlock containedin=ALL start="{{{" keepend end="}}}" contains=@htmlJavaScript,htmlCssStyleComment,htmlScriptTag,@htmlPreproc
" syn region jstBlock containedin=ALL start="{{" keepend end="}}" contains=@htmlJavaScript,htmlCssStyleComment,htmlScriptTag,@htmlPreproc
" syn region jstBlock containedin=ALL start="{{{_" keepend end="_}}}" contains=@htmlJavaScript,htmlCssStyleComment,htmlScriptTag,@htmlPreproc
" syn region jstBlock containedin=ALL start="{_" keepend end="_}" contains=@htmlJavaScript,htmlCssStyleComment,htmlScriptTag,@htmlPreproc
" syn region jstBlock containedin=ALL start="{%" keepend end="%}" contains=@htmlJavaScript,htmlCssStyleComment,htmlScriptTag,@htmlPreproc
" syn region jstBlock containedin=ALL start="{\*" keepend end="\*}" contains=@htmlJavaScript,htmlCssStyleComment,htmlScriptTag,@htmlPreproc
syn region jstExpr containedin=ALL start="{{" keepend end="}}" contains=jstPipe,@htmlJavaScript,htmlCssStyleComment
syn region jstExpr containedin=ALL start="{{{" keepend end="}}}" contains=jstPipe,@htmlJavaScript,htmlCssStyleComment
syn region jstExpr containedin=ALL start="{_" keepend end="_}" contains=jstPipe,jstPluralizer,@htmlJavaScript,htmlCssStyleComment
syn region jstExpr containedin=ALL start="{{{_" keepend end="_}}}" contains=jstPipe,jstPluralizer,@htmlJavaScript,htmlCssStyleComment
syn region jstBlock containedin=ALL start="{%" keepend end="%}" contains=@htmlJavaScript,htmlCssStyleComment
syn region jstComment containedin=ALL start="{\*" keepend end="\*}" contains=jstDependency,@htmlJavaScript,javaScriptCommentTodo

syn match jstPath "\([a-zA-Z0-9-_]\+/\)*\([a-zA-Z0-9-_]\+\.\)\+\(jst\|js\|css\|php\)" contained
syn keyword jstDependency requires template nextgroup=jstPath skipwhite contained

syn match jstFunction 	/sprintf\|\(tagged\|PETS\|_\|\$\)\(\.[a-zA-Z_\$]\+\)\+/ contained
syn match jstPipe 		"|"  contained nextgroup=jstFunction skipwhite
syn match jstPluralizer "||" contained  " covered by jstPipe

"Redefine these with different colors e.g. {{_"Hello %s" | sprintf name_}}
highlight! def link jstPipe 		PreProc
highlight! def link jstPluralizer	PreProc
highlight! def link jstFunction		Function
highlight def link jstComment		Comment
highlight def link jstPath		    String
highlight def link jstDependency	PreProc
" Assume all line comments will cause an error(well, not in generated scripts
highlight! def link javaScriptLineComment Error
 
let b:current_syntax = "jst"
