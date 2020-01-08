let g:ale_fix_on_save = 1
let g:ale_sign_error = '⨉'
let g:ale_sign_warning = '⚠'
" エラー行にカーソルをあわせた際に表示されるメッセージフォーマット
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']

nnoremap <C-a><C-f> :ALEFix<CR>

" linters 
let g:ale_linters = {
\   'python': ['flake8'],
\   'c': ['clang'],
\   'cpp': ['clang'],
\}
" Fixer
let g:ale_fixers = {
\ 'python': ['autopep8', 'black', 'isort'],
\ }

let g:ale_python_flake8_executable = g:python3_host_prog
let g:ale_python_flake8_options = '-m flake8'
let g:ale_python_autopep8_executable = g:python3_host_prog
let g:ale_python_autopep8_options = '-m autopep8'
let g:ale_python_isort_executable = g:python3_host_prog
let g:ale_python_isort_options = '-m isort'
let g:ale_python_black_executable = g:python3_host_prog
let g:ale_python_black_options = '-m black'
