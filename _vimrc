"Vi互換をオフ
if &compatible
    set nocompatible
endif

"----------------------------------------------------------------------
" for dein
"----------------------------------------------------------------------
"set runtimepath+=~/.vim/bundle/repos/github.com/Shougo/dein.vim
"set runtimepath+=~/.vim/bundle/repos/github.com/Shougo/dein.vim/bin
"call dein#begin(~/.vim/bundle/)
"call dein#add(~/.vim/bundle/repos/github.com/Shougo)
"call dein#add('Shougo/neocomplete.vim')
"call dein#end()

"filetype plugin indent on

"----------------------------------------------------------------------
" ウインドウに関する設定
"----------------------------------------------------------------------
" ウインドウの高さ
"set lines=50
" コマンドラインの高さ
set cmdheight=1
" スクロールする時に下が見えるようにする
set scrolloff=3
" ステータスラインを常に表示
"set laststatus=2

" 構文チェック
syntax enable

"----------------------------------------------------------------------
" コマンド入力
"----------------------------------------------------------------------
" 入力中のコマンドをステータスに表示する
set showcmd
" コマンドラインの補完
"set wildmore=list:longest

"----------------------------------------------------------------------
" keymappingに関する設定
"----------------------------------------------------------------------
" Insert modeでkey mapping
"inoremap <C-e> <Esc>$a
"inoremap <C-e> <Esc>^a
"----------------------------------------------------------------------
" Normal modeでkey mapping
"noremap <C-e> <Esc>$a
"noremap <C-e> <Esc>^a
" 折り返し時に表示行単位での移動ができるようにする
"nnoremap j gj
"nnoremap k gk

" .swapファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バックアップアップをしない
set nobackup

" 文字エンコーディング
set encoding=UTF-8
set fileencoding=UTF-8
set termencoding=UTF-8

" ビープ音を消す
"set vb tb_vb=
set novisualbell

"新しい行のインデントを現在行と同じにする
set autoindent
"バックアップファイルを作るディレクトリ
"set backupdir=$HOME/vimbackup
"ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set browsedir=buffer 
"クリップボードをOSと連携
"set clipboard=unnamed,autoselect

" 右下に表示される行・列の番号を表示する
set ruler

"スワップファイル用のディレクトリ
"set directory=$HOME/vimbackup
"タブの代わりに空白文字を挿入する
"set expandtab
"変更中のファイルでも、保存しないで他のファイルを表示
set hidden

"----------------------------------------------------------------------
"" サーチ
"インクリメンタルサーチを行う
set incsearch
" 検索をファイルの先頭へループする
set wrapscan
" 検索をハイライトする
set hlsearch
" ESC連打でハイライト解除
"nmap <Esc><Esc> :nohlsearch<CR><Esc>
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索時に大文字を含んでいたら大/小を区別
set smartcase
"----------------------------------------------------------------------
"8進数のカウントアップ／ダウンをしない
set nrformats=
"タブ文字、行末など不可視文字を表示する
"set list
"listで表示される文字のフォーマットを指定する
set listchars=eol:$,tab:>\ ,extends:<
"行番号を表示する
set number
" 現在の行を強調表示
set cursorline
" 現在の桁を強調表示
"set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
"set virtualedit=onemore
"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
"新しい行を作ったときに高度な自動インデントを行う
set smartindent
"----------------------------------------------------------------------
"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab
"シフト移動幅
"ファイル内の 行頭の<Tab> が対応する空白の数
set shiftwidth=4
set softtabstop=4
"ファイル内の 行頭以外の<Tab> が対応する空白の数
set tabstop=4
"----------------------------------------------------------------------
"カーソルを行頭、行末で止まらないようにする
"set whichwrap=b,s,h,l,<,>,[,]

" 80カラムに目印
"if (exists('+colorcolumn'))
"	set colorcolumn=80
"	highlight ColorColumn ctermbg=9
"endif

"ウィンドウを最大化して起動
"au GUIEnter * simalt ~x

"入力モード時、ステータスラインのカラーを変更
augroup InsertHook
autocmd!
autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END

" markdownを認識する
autocmd BufRead,BufNewFile *.md set filetype=markdown

"日本語入力をリセット
au BufNewFile,BufRead * set iminsert=0
"タブ幅をリセット
au BufNewFile,BufRead * set tabstop=4 shiftwidth=4

".txtファイルで自動的に日本語入力ON
au BufNewFile,BufRead *.txt set iminsert=2
".rhtmlと.rbでタブ幅を変更
au BufNewFile,BufRead *.rhtml   set nowrap tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.rb  set nowrap tabstop=2 shiftwidth=2

"全角スペースを視覚化
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/

" for Verilog plugin
source $VIMRUNTIME/macros/matchit.vim

" ファイルタイプ別のプラグイン/インデントを有効にする
filetype plugin indent on

""""""""""""""
" NeoBundle
""""""""""""""

if has('vim_starting')
	" 初回起動時のみruntimepathにneobundleのパスを指定する
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" NeoBundleを初期化
call neobundle#begin(expand('~/.vim/bundle/'))

" インストールするプラグインをここに記述
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'

"" Swift
"NeoBundle 'toyamarinyon/vim-swift'
"if has("mac")
"	NeoBundle 'toyamarinyon/vim-swift'
"
"	let g:quickrun_config['swift'] = {
"				\ 'command': 'xcrun',
"				\ 'cmdopt': 'swift',
"				\ 'exec': '%c %o %s',
"				\}
"endif

" Verilog hilite
"NeoBundle 'vimtaku/hl_matchit.vim.git'

" Verilog snippet
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
let g:neosnippet#snippts_directory='~/.vim/snippets/'

"NERDTree
NeoBundle 'scrooloose/nerdtree'

"Syntastic
NeoBundle 'scrooloose/syntastic'

""vim-tags
"NeoBundle 'szw/vim-tags'
"au BufNewFile,BufRead *.php let g:vim_tags_project_tags_command = "ctags --languages=php -f ~/php.tags `pwd` 2>/dev/null &"
"type ":TagsGenerate"

"evervim
NeoBundle 'kakkyz81/evervim'
let g:evervim_devtoken="S=s95:U=9f3e33:E=15f6402650f:C=1580c513758:P=1cd:A=en-devtoken:V=2:H=7160510c20d40a4b7ca91e8049ff7c84"

call neobundle#end()

"NeoBundleCheck



" :NeoBundleInstall
" :NeoBundleUpdate ...
" :NeoBundleClean vimfiler

