" encoding: utf-8

" File:        flay.vim
" Author:      Corey Prophitt <prophitt.corey [at] gmail [dot] com>
" Licence:     MIT

" Load gems first time we execute the script
ruby << EOF
    require "rubygems"
    require "flay"
EOF

let s:lines=[]
let s:line_info={}
let s:processed_file=0

function! flay#execute()
    if filereadable( expand("%:p") )
        " Force save, may be modified or new..
        silent write
        call flay#process_file()
    endif
endfunction

function! flay#process_file()
    if match(expand("%:p"), '/.git/*') != -1 || !filereadable( expand("%:p") )
        return
    endif

ruby << EOF
    flay = Flay.new
    flay.process(VIM::Buffer.current.name)
    flay.analyze

    new_signs = []
    total_mass = 0

    flay.masses.each do |hash, mass|
        total_mass += mass
        hash = flay.hashes[hash]

        lines = hash.map(&:line)
        lines.each do |line|
            new_signs << line.to_i

            type = flay.identical[hash] ? "Identical" : "Similar"
            info = "#{type} code found, mass = #{mass}, lines = #{lines.join(",")}"

            VIM.command "let s:line_info['#{line}'] = '#{info}'"
            VIM.command ":sign place #{line} name=piet line=#{line} file=#{VIM::Buffer.current.name}"
        end
    end

    (VIM.evaluate("s:lines") - new_signs).each do |bad_sign|
        VIM.command ":sign unplace #{bad_sign}"
    end

    VIM.command "let s:lines=[#{new_signs.join(",")}]"
    VIM.command ":echo 'Total Flay score (lower is better) = #{total_mass}'"
EOF

    let s:processed_file=1
endfunction

function! flay#clear_signs()
    if s:processed_file
        for line in s:lines
            execute "sign unplace " . line
        endfor
        let s:line_info={}
        let s:lines=[]
        let s:processed_file=0
        echo "All signs cleared"
    else
        echo "File not processed, did you run Flay?"
    end
endfunction

function! flay#draw_info()
    let current_line=line(".")
    if index(s:lines, current_line) != -1
        echo "Current Line!"
        echo s:line_info[current_line]
    else
        echo ""
    end
endfunction

function! flay#toggle()
    if s:processed_file
        call flay#clear_signs()
    else
        call flay#process_file()
    endif
endfunction

function! flay#list()
    if s:processed_file
        if len(s:lines) > 0
            echo "Lines to flay = " . join(s:lines, ",")
        else
            echo "No lines to flay"
        end
    else
        echo "File not processed, did you run Flay?"
    endif
endfunction

" vim: ai tabstop=4 expandtab shiftwidth=4 softtabstop=4
