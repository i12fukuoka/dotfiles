"#####vim起動時に実行#####
if has('vim_starting')
    if &compatible
        set nocompatible
    endif

    if !isdirectory(expand("~/.vim/repos/github.com/Shougo/dein.vim"))
        echo "installing dein"
        :call system("git clone https://github.com/Shougo/dein.vim ~/.vim/repos/github.com.Shougo/dein.vim")
    endif

    set runtimepath+=~/.vim/repos/github.com/Shougo/dein.vim
endif


"#####プラグイン管理#####
if dein#load_state(expand('~/.vim/dein'))
    call dein#begin(expand('~/.vim/dein'))
    call dein#add('Shougo/vimproc.vim', {'build': 'make'})

    call dein#add('Shougo/neocomplete.vim')
    call dein#add('Yggdroot/indentLine')

    call dein#end()
    call dein#save_state()
endif

if dein#check_install()
    call dein#install()
endif


"#####画面#####
set columns=238
set lines=54
colorscheme murphy "カラースキーマを設定
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


"#####空白，タブの設定#####
set ambiwidth=double "文脈によって解釈が異なる全角文字の幅を2に固定"
set tabstop=4 "タブ幅をスペース４つ分"
set expandtab "tabを半角スペースで挿入する"
set shiftwidth=4 "vimが自動で生成するtab幅をスペース4つ分"


"#####インデント#####
syntax on "コードの色分け
set autoindent "オートインデント
set smartindent "改行時などに、自動でインデントを設定してくれる"
filetype plugin indent on "ファイルタイプの自動認識
"autocmd BufRead,BufNewFile *.java setfiletype java


"#####見易さ#####
set cursorline "カーソルがある行を強調表示"
set number "行番号の表示"
set colorcolumn=80 "80行目に線を入れる
set scrolloff=3 "スクロール時の余白"
set list "空白文字の可視化"
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:% "可視化した空白文字の表示形式
set vb t_vb= "beep音を切る、画面フラッシュも消す


"#####テンプレート#####
autocmd BufNewFile *.html 0r ~/dotfiles/templates/template.html "htmlのテンプレート
autocmd BufNewFile *.c 0r ~/dotfiles/templates/template.c
autocmd BufNewFile *.java 0r ~/dotfiles/templates/template.java
autocmd BufNewFile *.tex 0r ~/dotfiles/templates/template.tex


"#####検索設定#####
set ignorecase "大文字/小文字の区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan "検索時に最後まで行ったら最初に戻る
set incsearch "インクリメンタル検索を有効
set hlsearch "検索結果をハイライト表示
