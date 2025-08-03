if exists("b:current_syntax")
    finish
endif

" Originally taken from Enrico Tassi's https://github.com/LPCIC/elpi

syntax keyword elpiKeyword mode macro type pred namespace rule constraint uvar
syntax keyword elpiKeyword shorten kind func
syntax match elpiKeyword ":before"
syntax match elpiKeyword ":functional"
syntax match elpiKeyword ":after"
syntax match elpiKeyword ":name"

syntax match elpiIdentifier  "\<\l[-a-zA-Z\.+*/\\^<>=`'~?@#$&!_]*\>"

syntax match elpiVariable  "\<\u[-a-zA-Z\.+*/\\^<>=`'~?@#$&!_0-9]*\>"
syntax match elpiVariable  "_"

syntax match elpiClauseSymbols ":-"
syntax match elpiClauseSymbols "\."

syntax match elpiMacro "@\(\w\|-\)\+"

syntax match elpiSpill "{"
syntax match elpiSpill "}"

syntax region elpiQuotation start="{{" end="}}" contains=@elpiAntiQuotation

syntax match elpiOperator "," ";" "=" "<" ">"
syntax match elpiOperator "=<" ">="
syntax keyword elpiOperator not is
syntax match elpiOperator "\v\w@<!!" " a ! not preceded by a word char

syntax match elpiComment "%.*$"

syntax match elpiArgumentMode "\<o:" "\<i:"

highlight link elpiComment Comment
highlight link elpiKeyword Keyword
highlight link elpiOperator Operator
highlight link elpiIdentifier Constant
highlight link elpiClauseSymbols Type
highlight link elpiMacro Macro
highlight link elpiSpill Special
highlight link elpiArgumentMode Special
highlight link elpiVariable Identifier

let b:current_syntax = "elpi"
