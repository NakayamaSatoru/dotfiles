" env{{{
let $CACHE = empty($XDG_CACHE_HOME) ? expand('$HOME/.cache') : $XDG_CACHE_HOME
let $CONFIG = empty($XDG_CONFIG_HOME) ? expand('$HOME/.config') : $XDG_CONFIG_HOME
let $DATA = empty($XDG_DATA_HOME) ? expand('$HOME/.local/share') : $XDG_DATA_HOME
" }}}
" dein{{{
if &compatible
  set nocompatible
endif

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let s:toml_dir = expand('~/.config/nvim')
  call dein#load_toml(s:toml_dir.'/dein.toml', {'lazy': 0})
  call dein#load_toml(s:toml_dir.'/dein_lazy.toml', {'lazy': 1})
  call dein#load_toml(s:toml_dir.'/cpp.toml', {'lazy': 1})
  call dein#load_toml(s:toml_dir.'/python.toml', {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif
if dein#check_install()
 call dein#install()
endif
filetype plugin indent on
syntax enable
" }}}
" search & replace{{{
" 大文字小文字を無視,ただし大文字があると無視しない
set ignorecase
set smartcase
" 末尾まで検索したら先頭に戻る
set wrapscan
" 入力中に検索される
set incsearch
" 置換がかっこよくなるやつ
set inccommand=split
" esc二回押しでハイライトが消える
nmap <Esc><Esc> :nohl<CR>
" }}}
" tab size & indent{{{
" スペース4つでtab
set tabstop=4
" 行をインデントしたらスペース4つ 
set shiftwidth=4
" Tabを押したときスペース4つ
set softtabstop=4
" tabstopにshiftwidthとsofttabstopが到達しても変換されない
set expandtab
" 行頭Tabでshifwidth分のスペースが挿入
set smarttab
" シフトしたときにshiftwidth分のスペースが挿入
set shiftround
" 改行時に前行のインデントを保持する
set autoindent
" Makefile時にのみTab文字にする
let _curfile=expand("%:r")
if _curfile == 'Makefile'
  set noexpandtab
endif
" }}}
" file split{{{

" }}}
" move {{{
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <C-n> 20j
vnoremap <C-n> 20j
nnoremap <C-p> 20k
vnoremap <C-p> 20k
" }}}
" others {{{
" インサートモード時にesc二回押しで保存
inoremap <Esc><Esc> <ESC>:<C-u>w<CR>
" 畳み込みを有効
set foldmethod=marker
" 行番号を表示
set number
" ヤンクでclipboardに送る
set clipboard=unnamed
" 前回のカーソル位置を覚える
if has("autocmd")
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif
"}}}
" python {{{
let g:python_host_prog = $PYENV_ROOT.'/versions/neovim2/bin/python'
let g:python3_host_prog = $PYENV_ROOT.'/versions/neovim3/bin/python'
" }}}
