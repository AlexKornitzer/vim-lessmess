"            MIT License
"
" Copyright (c) 2017 Mohamed Boughaba
"
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the "Software"), to deal
" in the Software without restriction, including without limitation the rights
" to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
" copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
"
" The above copyright notice and this permission notice shall be included in all
" copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
" OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
" SOFTWARE.
"
" Author: Mohamed Boughaba
" Repository: https://github.com/mboughaba/vim-lessmess
" Description: This plugin removes all empty white-spaces in a file
"
"
"
" loading {{{
"
"
if exists('g:loaded_lessmess') || &cp || version < 702
    fini
el
    "
    " Enable white-spaces removal on save by default
    "
    if !exists("g:enable_lessmess_onsave")
        let g:enable_lessmess_onsave = 1
    en
en
" }}}

" Auto Command {{{
"
" If configured this will invoke white-space stripping
"
if exists("g:enable_lessmess_onsave") && g:enable_lessmess_onsave == 1
    aug lessmess#strip_whitespaces_onsave
        au!
        au BufWritePost * sil cal lessmess#LessmessExecute(0)
    aug end
en
"
" To minimize the impact of the heavy regex replace
" we will setup an autocommand to run when ViM is idle
"
" With this we will check if the file is dirty
"
aug lessmess#dirty_checking
    au!
    au CursorHold * sil cal lessmess#_dirtyCheck()
aug end
" }}}

" Commands {{{
"
" Commands
"
com! LessmessDisplayToggle sil cal lessmess#LessmessDisplayToggle()
com! LessmessExecute sil cal lessmess#LessmessExecute(0)
com! LessmessForceExecute sil cal lessmess#LessmessExecute(1)
com! LessmessToggle sil cal lessmess#LessmessToggle()
com! LessmessStatus echo lessmess#LessmessStatus()
" }}}

let g:loaded_lessmess = 1
" vim: se sw=4 sts=4 et fdm=marker:
