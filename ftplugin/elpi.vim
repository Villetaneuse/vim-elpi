" Only source once.
if exists('b:did_ftplugin')
    finish
endif
let b:did_ftplugin = 1

" vim-commentary support
setlocal commentstring=%\ %s
