if exists("b:did_indent")
    finish
endif

let b:did_indent = 1

" Slightly modified version of Vim's runtime/indent/prolog.vim

setlocal indentexpr=GetElpiIndent()
setlocal indentkeys-=:,0#
setlocal indentkeys+=0%,-,0;,>,0)

let b:undo_indent = "setl inde< indk<"

function! GetElpiIndent()
    " Find a non-blank line above the current line.
    let pnum = prevnonblank(v:lnum - 1)
    " Hit the start of the file, use zero indent.
    if pnum == 0
       return 0
    endif
    let line = getline(v:lnum)
    let pline = getline(pnum)

    let ind = indent(pnum)
    " Previous line was comment -> use previous line's indent
    if pline =~ '^\s*%'
    return ind
    endif
    " Check for clause head on previous line
    if pline =~ '\%(:-\|-->\)\s*\(%.*\)\?$'
    let ind = ind + shiftwidth()
    " Check for end of clause on previous line
    elseif pline =~ '\.\s*\(%.*\)\?$'
    let ind = ind - shiftwidth()
    endif
    " Check for opening conditional on previous line
    if pline =~ '^\s*\([(;]\|->\)'
    let ind = ind + shiftwidth()
    endif
    " Check for closing an unclosed paren, or middle ; or ->
    if line =~ '^\s*\([);]\|->\)'
    let ind = ind - shiftwidth()
    endif
    return ind
endfunction
