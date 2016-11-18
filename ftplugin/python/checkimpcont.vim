" Vim plugin for checking possibly misleading string literal concatenations
" License: Public domain
" Language: Python
" Usage:
" To use this plugin please first install the Python checker utility:
" https://github.com/congma/checkimpcont
" To install this plugin, put it in your .vim/ftplugin/python, or use
" pathogen.
" For command mappling, use the variable g:checkimpcont_map to define the
" mapping for the check function.  Default value: <Leader>C

" Shamelessly plagiarized from
" http://www.vim.org/scripts/script.php?script_id=2914
" See also
" https://github.com/vim-scripts/pep8

if ( exists("g:loaded_ft_python_checkimpcont") ||
	    \ (!executable("checkimpcont.py")) )
    finish
endif
let g:loaded_ft_python_checkimpcont = 1

let s:save_cpo = &cpo
set cpo&vim

function! <SID>CheckImpCont()
    set lazyredraw
    " Close any existing cwindows.
    cclose
    let l:grepformat_save = &grepformat
    let l:grepprg_save = &grepprg
    setlocal grepformat=%-P[%f],%A%l:%c:\ %t%.%#:\ %m,%-C%s,%-C%p^
    setlocal grepprg=(echo\ ['%'];checkimpcont.py\ '%')
    if &readonly == 0 | update | endif
    silent grep!
    let &l:grepformat = l:grepformat_save
    let &l:grepprg = l:grepprg_save
    belowright cwindow
    set nolazyredraw
    redraw!
endfunction

if !exists('g:checkimpcont_map')
    let g:checkimpcont_map = '<Leader>C'
endif

if ( !hasmapto('<SID>CheckImpCont()') && (maparg(g:checkimpcont_map) == '') )
    exe 'nnoremap <silent> ' .
		\ g:checkimpcont_map .
		\ ' :call <SID>CheckImpCont()<CR>'
endif

let &cpo = s:save_cpo
