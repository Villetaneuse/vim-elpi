if exists("b:current_syntax")
    finish
endif

" Taken from Enrico Tassi's https://github.com/LPCIC/elpi

syntax keyword elpiKeyword mode macro type pred namespace rule constraint uvar shorten
highlight link elpiKeyword Keyword

syntax match elpiIdentifier  "\<\l[-a-zA-Z\.+*/\\^<>=`'~?@#$&!_]*\>"
syntax region elpiClause start="^\<\l[-a-zA-Z\.+*/\\^<>=`'~?@#$&!_]*\>" end=" \|:-\|\."
syntax match elpiClauseSymbols ":-"
syntax match elpiClauseSymbols "\."

syntax match elpiKeyword ":before"
syntax match elpiKeyword ":after"
syntax match elpiKeyword ":name"
syntax match elpiMacro "@\(\w\|-\)\+"
syntax match elpiSpill "{"
syntax match elpiSpill "}"
syntax region elpiQuotation start="{{" end="}}" contains=@elpiAntiQuotation

highlight link elpiClauseSymbols Type
highlight link elpiMacro Special
highlight link elpiSpill Special

let b:current_syntax = "elpi"
