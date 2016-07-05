"カラースキーマを設定
colorscheme murphy
" 暗い配色にする
set background=dark

set number "行番号の表示"
set title "ターミナルのタイトルをセットする"

set ambiwidth=double "文脈によって解釈が異なる全角文字の幅を2に固定"
set tabstop=4 "タブ幅をスペース４つ分"
set expandtab "tabを半角スペースで挿入する"
set shiftwidth=4 "vimが自動で生成するtab幅をスペース4つ分"

set showmatch "括弧入力時の対応する括弧を表示

set smartindent "改行時などに、自動でインデントを設定してくれる"
set list "空白文字の可視化"
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
"可視化した空白文字の表示形式"

set nrformats-=octal "0で始まる数値を8進数として扱わないようにする"
set hidden "ファイルの保存をしていなくても別のファイルを開けるようにする"

set history=50 ""
set virtualedit=block
set whichwrap=b,s,[,],<,>
set backspace=indent,eol,start
set wildmenu wildmode=list:full "コマンドラインモードにおける補完機能"	

"####インデント#####
syntax on "コードの色分け
set autoindent "オートインデント
filetype on "ファイルタイプの自動認識
"autocmd BufRead,BufNewFile *.java setfiletype java

"#####見易さ#####
set cursorline "カーソルがある行を強調表示"
set colorcolumn=80 "80行目に線を入れる
set mouse=a "マウス有効化"
set scrolloff=3 "スクロール時の余白"

set vb t_vb= "beep音を切る、画面フラッシュも消す

"#####画面サイズ#####
set columns=238
set lines=54

"#####テンプレート#####
autocmd BufNewFile *.html 0r ~/dotfiles/templates/html.txt "htmlのテンプレート
autocmd BufNewFile *.c 0r ~/dotfiles/templates/c.txt
autocmd BufNewFile *.java 0r ~/dotfiles/templates/java.txt
autocmd BufNewFile *.tex 0r ~/dotfiles/templates/tex.txt

"#####検索設定#####
set ignorecase "大文字/小文字の区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan "検索時に最後まで行ったら最初に戻る
set incsearch "インクリメンタル検索を有効"
