"#####画面#####
colorscheme molokai
set columns=238
set lines=54
set background=dark             "暗い配色にする
set splitbelow                  "新規ウィンドウは下
set splitright                  "新規ウィンドウは右
set ttyfast                     "スクロールが再描画に?


"#####便利な設定#####
set history=50 ""
set nrformats-=octal            "0で始まる数値を8進数として扱わないようにする"
set hidden                      "ファイルの保存をしていなくても別のファイルを開けるようにする"
set virtualedit=block
set whichwrap=h,l,<,>,[,],b,s,~ "移動時に折り返してくれるオプションの指定，フルオプション
set backspace=indent,eol,start
set wildmenu wildmode=list:full "コマンドラインモードにおける補完機能"	
set showmatch                   "括弧入力時の対応する括弧を表示
set title                       "ターミナルのタイトルをセットする"
set mouse=a                     "マウス有効化"
set vb t_vb=                    "beep音を切る，画面フラッシュも消す
set nostartofline               "移動コマンドを使った時に行頭に移動しない


"#####空白，タブの設定#####
set ambiwidth=double            "文脈によって解釈が異なる全角文字の幅を2に固定
set expandtab                   "tabを半角スペースで挿入する
set smarttab                    "たぶんバックスペースで半角スペース4つ削除かな?
"set tabstop=4                  "タブ幅をスペース４つ分
set shiftwidth=4                "vimが自動で生成するtab幅をスペース4つ分
set shiftround                  "インデントをshiftwidthの倍数に丸める


"#####インデント#####
set autoindent                  "オートインデント
set smartindent                 "改行時などに，自動でインデントを設定してくれる


"#####見易さ#####
set cursorline                  "カーソルがある行を強調表示"
set number                      "行番号の表示"
"set colorcolumn=80             "80行目に線を入れる
set scrolloff=3                 "スクロール時の余白"
set list                        "空白文字の可視化"
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:% "可視化した空白文字の表示形式


"#####長文の折り返し#####
set linebreak                   "ちょうどいいところで折り返してくれる
set showbreak=>\                "折り返された行の先頭に表示する文字
set breakat=\ \ ;:,!?           "折り返し可能な文字の指定
"折り返した後もインデントしてくれる
if exists('+breakindent')
    set breakindent
    set wrap
else
    set nowrap
endif


"#####grep#####
set grepprg=grep\ -nh           "vimgrepは外部grepを使用


"#####折りたたみ機能#####
"set foldenable
set foldmethod=marker           "{{{...}}}で囲まれた範囲を折りたたむ
"set foldcolumn=1
"set fillchars=vert:\|
"set commentstring=%s


"#####vimが勝手に作るファイル関連#####
set noswapfile                 "swapファイルを作らない
set nobackup
set nowritebackup
set backupdir-=.
set directory-=.                "swapファイルはtmpにのみ作る
set undofile                    "実はundoファイルも作ってくれる
let &g:undodir = &directory     "これもswapファイルと同じ場所へ


"#####日本語フォーマット####
set formatexpr=autofmt#japanese#formatexpr()    "plugins依存


"#####ステータスライン#####
set laststatus=2                "ステータスラインは二行
set cmdheight=2                 "コマンドラインは二行
set statusline=%<%(%F%m%r%)
              \%=
              \%(char:%b%)
              \%([ft:%Y][enc:%{&encoding}]%)
              \%([line:%l/%L%5P]%)
              \%([size:%obyte]%)


"#####テンプレート#####
"autocmd BufNewFile *.html 0r ~/dotfiles/templates/template.html "htmlのテンプレート
"autocmd BufNewFile *.c 0r ~/dotfiles/templates/template.c
"autocmd BufNewFile *.java 0r ~/dotfiles/templates/template.java
"autocmd BufNewFile *.tex 0r ~/dotfiles/templates/template.tex
"autocmd BufNewFile *.py 0r ~/dotfiles/templates/template.py


"#####検索設定#####
set ignorecase                  "大文字/小文字の区別なく検索する
set smartcase                   "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan                    "検索時に最後まで行ったら最初に戻る
set incsearch                   "インクリメンタル検索を有効
set nohlsearch                  "検索結果をハイライト表示しない


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

let g:tex_flavor='latex'
