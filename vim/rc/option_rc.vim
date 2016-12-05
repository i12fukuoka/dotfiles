"#####画面#####
set columns=238
set lines=54
colorscheme molokai "カラースキーマを設定
set background=dark "暗い配色にする


"#####便利な設定#####
set history=50 ""
set nrformats-=octal "0で始まる数値を8進数として扱わないようにする"
set hidden "ファイルの保存をしていなくても別のファイルを開けるようにする"
set virtualedit=block
set whichwrap=b,s,[,],<,>
set backspace=indent,eol,start
set wildmenu wildmode=list:full "コマンドラインモードにおける補完機能"	
set showmatch "括弧入力時の対応する括弧を表示
set title "ターミナルのタイトルをセットする"
set mouse=a "マウス有効化"
set noswapfile "swapファイルを作らない
inoremap jj <ESC> "jjと高速に入力すればノーマルモードに戻る
inoremap kk <ESC>


"#####空白，タブの設定#####
set ambiwidth=double "文脈によって解釈が異なる全角文字の幅を2に固定"
set expandtab "tabを半角スペースで挿入する"
set smarttab "たぶんバックスペースで半角スペース4つ削除かな?
set tabstop=4 "タブ幅をスペース４つ分"
set shiftwidth=4 "vimが自動で生成するtab幅をスペース4つ分"


"#####インデント#####
"syntax on "コードの色分け
set autoindent "オートインデント
set smartindent "改行時などに，自動でインデントを設定してくれる"
"filetype plugin indent on "ファイルタイプの自動認識
"autocmd BufRead,BufNewFile *.java setfiletype java


"#####見易さ#####
set cursorline "カーソルがある行を強調表示"
set number "行番号の表示"
"set colorcolumn=80 "80行目に線を入れる
set scrolloff=3 "スクロール時の余白"
set list "空白文字の可視化"
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:% "可視化した空白文字の表示形式
set vb t_vb= "beep音を切る，画面フラッシュも消す


"#####テンプレート#####
"autocmd BufNewFile *.html 0r ~/dotfiles/templates/template.html "htmlのテンプレート
"autocmd BufNewFile *.c 0r ~/dotfiles/templates/template.c
"autocmd BufNewFile *.java 0r ~/dotfiles/templates/template.java
"autocmd BufNewFile *.tex 0r ~/dotfiles/templates/template.tex
"autocmd BufNewFile *.py 0r ~/dotfiles/templates/template.py


"#####検索設定#####
set ignorecase "大文字/小文字の区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan "検索時に最後まで行ったら最初に戻る
set incsearch "インクリメンタル検索を有効
set hlsearch "検索結果をハイライト表示


"#####バイナリーファイルへの対応#####
augroup BinaryXXD
    autocmd!
    autocmd BufReadPre  *.bin let &binary =1
    autocmd BufReadPost * if &binary | silent %!xxd -g 1
    autocmd BufReadPost * set ft=xxd | endif
    autocmd BufWritePre * if &binary | %!xxd -r | endif
    autocmd BufWritePost * if &binary | silent %!xxd -g 1
    autocmd BufWritePost * set nomod | endif
augroup END


"#####C--の開発のための設定#####
au BufNewFile,BufRead *.cmm setf c


