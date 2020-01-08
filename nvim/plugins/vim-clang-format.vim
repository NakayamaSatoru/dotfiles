function! CPPCodeCleanup()
  let l:lines='all'
  let g:clang_format_fallback_style = 'Google'
  :pyf /usr/share/clang/clang-format.py
endfunction
command! CPPCodeCleanup call CPPCodeCleanup()
autocmd BufWrite *.{cpp} :CPPCodeCleanup
