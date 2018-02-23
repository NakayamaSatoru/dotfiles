" 'dein' {{{
" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.dotfiles/.vim/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
  if &runtimepath !~# '/dein.vim'
if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
  endif

  " 設定開始
  if dein#load_state(s:dein_dir)
call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  let g:rc_dir    = expand('~/.dotfiles/.vim/dein/toml')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
call dein#save_state()
  endif

  " もし、未インストールものものがあったらインストール
  if dein#check_install()
call dein#install()
  endif

" }}}

" 'clang-format' {{{
function! s:clang_format()
  let now_line = line(".")
  exec ":%! clang-format"
  exec ":" . now_line
  endfunction
  if executable('clang-format')
    augroup cpp_clang_format
      autocmd!
      autocmd BufWrite,FileWritePre,FileAppendPre *.{ino,cc,h,cpp,hpp} call s:clang_format()
      augroup END
      endif
" }}}

" 'Shougo/deoplete' {{{
"  let g:deoplete#enable_at_startup = 1
" }}}

" 'Shougo/neocomplete.vim' {{{
" Vim起動時にneocompleteを有効にする
let g:neocomplete#enable_at_startup = 1
" smartcase有効化. 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplete#enable_smart_case = 1
" 3文字以上の単語に対して補完を有効にする
let g:neocomplete#min_keyword_length = 3
" 区切り文字まで補完する
let g:neocomplete#enable_auto_delimiter = 1
" 1文字目の入力から補完のポップアップを表示
let g:neocomplete#auto_completion_start_length = 1
" バックスペースで補完のポップアップを閉じる
inoremap <expr><BS> neocomplete#smart_close_popup()."<C-h>"

" エンターキーで補完候補の確定. スニペットの展開もエンターキーで確定・・・・・・②
imap <expr><CR> neosnippet#expandable() ? "<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "<C-y>" : "<CR>"
" タブキーで補完候補の選択. スニペット内のジャンプもタブキーでジャンプ・・・・・・③
imap <expr><TAB> pumvisible() ? "<C-n>" : neosnippet#jumpable() ? "<Plug>(neosnippet_expand_or_jump)" : "<TAB>"
" }}}

" 'setting' {{{
"文字コードをUFT-8に設定
set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8 
" 読み込み時の文字コードの自動判別
set fileencodings=utf-8
" 改行コードの自動判別
set fileformats=unix 
" 幸せになる
set ambiwidth=double
" 折りたたみ
au FileType vim setlocal foldmethod=marker
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
" }}}

" '検索' {{{
" 1文字ごとに検索
set incsearch 
" 検索パターンに大文字小文字を区別しない
set ignorecase 
" 検索パターンに大文字を含んでいたら大文字小文字を区別する
set smartcase
" 検索結果をハイライト
set hlsearch 
" ESCキー2度押しでハイライトの切り替え
nnoremap <silent><Esc><Esc> :nohlsearch<CR>
" }}}

" 'Tab系' {{{
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2
" }}}

" '見た目' {{{
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
set autoindent
" syntax
syntax on
" }}}

