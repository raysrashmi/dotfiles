" encoding: utf-8

" File:        flay.vim
" Author:      Corey Prophitt <prophitt.corey [at] gmail [dot] com>
" Licence:     MIT

if ( exists('g:loaded_flay') && g:loaded_flay ) || v:version < 700 || &cp
    finish
endif

if !has('signs') || !has('ruby')
    echoerr "Compile VIM with signs and ruby interop to use this plugin."
    finish
endif

if !executable("flay")
    echoerr "To use this plugin you must install the Flay gem. " .
                \ "Install the gem on your local system with `" .
                \ "gem install flay`"
    finish
endif

let g:loaded_flay=1

if exists("g:flay_piet_text")
    let s:piet_text=g:flay_piet_text
else
    let s:piet_text=">>"
endif

execute "sign define piet text=" . s:piet_text . " texthl=Search"

command! -nargs=0 Flay call flay#execute()
command! -nargs=0 FlayClear call flay#clear_signs()
command! -nargs=0 FlayToggle call flay#toggle()
command! -nargs=0 FlayList call flay#list()

augroup flayFiletypes
    autocmd!

    if exists("g:flay_on_open") && g:flay_on_open
        autocmd FileType ruby silent :call flay#process_file()
    endif

    if exists("g:flay_on_save") && g:flay_on_save
        autocmd FileWritePre    *.rb :call flay#process_file()
        autocmd FileAppendPre   *.rb :call flay#process_file()
        autocmd FilterWritePre  *.rb :call flay#process_file()
        autocmd BufWritePre     *.rb :call flay#process_file()
    endif

    autocmd CursorMoved *.rb call flay#draw_info()
augroup END

" vim: ai tabstop=4 expandtab shiftwidth=4 softtabstop=4
