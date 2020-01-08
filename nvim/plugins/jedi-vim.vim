let g:jedi#goto_command = "<Leader>d"
autocmd FileType python setlocal omnifunc=jedi#completions
autocmd FileType python setlocal completeopt-=preview
