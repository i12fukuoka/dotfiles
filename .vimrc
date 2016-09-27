"#####MyAutoCmdの初期化#####
augroup MyAutoCmd
    autocmd!
augroup END


"#####vim起動時に実行#####
if has('vim_starting')
    if &compatible
        set nocompatible
    endif

    if !isdirectory(expand("~/.vim/repos/github.com/Shougo/dein.vim"))
        echo "installing dein"
        :call system("git clone https://github.com/Shougo/dein.vim ~/.vim/repos/github.com/Shougo/dein.vim")
    endif

    set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after,~/.vim/repos/github.com/Shougo/dein.vim
endif


"#####プラグイン管理#####
if dein#load_state(expand('~/.vim/dein'))
    call dein#begin(expand('~/.vim/dein'))
    call dein#add('Shougo/vimproc.vim', {
                \ 'build' : {
                \     'windows' : 'make -f make_mingw32.mak',
                \     'cygwin' : 'make -f make_cygwin.mak',
                \     'mac' : 'make -f make_mac.mak',
                \     'unix' : 'make -f make_unix.mak',
                \    },
                \ })

    call dein#add('Shougo/neocomplete.vim') "補完機能，設定済
    call dein#add('Shougo/neosnippet.vim') "補完強化，設定済
    call dein#add('Shougo/neosnippet-snippets') "snippet.vimの辞書的な
    call dein#add('honza/vim-snippets') "other snippets
    call dein#add('Shougo/unite.vim') "なんかいろいろと便利，未設定
    call dein#add('Yggdroot/indentLine') "インデント整えるやつ
    call dein#add('Shougo/neoyank.vim') "yank/history 未設定
    call dein#add('itchyny/lightline.vim') "ステータスラインの改造用，未設定
    call dein#add('tomasr/molokai') "カラースキーマ用
    call dein#add('tpope/vim-fugitive') "vim上でgitを使うよう,主にdiff用
    call dein#add('thinca/vim-template') "テンプレート使うのに便利，あと特定文字列の変換
    call dein#add('thinca/vim-quickrun') "なんか便利なやつ
    call dein#add('scrooloose/syntastic') "構文チェック，Syntaxチェックツールは自分でいれる必要あり

    call dein#add('davidhalter/jedi-vim') "pythonの補完強化

    call dein#add('mattn/jscomplete-vim') "javascriptのメソッド補完，設定済
    call dein#add('jelera/vim-javascript-syntax') "javascriptのsyntax強化，設定無し?
    call dein#add('jiangmiao/simple-javascript-indenter') "javascriptのインデント強化，設定済

    call dein#end()
    call dein#save_state()
endif

if dein#check_install()
    call dein#install()
endif


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


"#####空白，タブの設定#####
set ambiwidth=double "文脈によって解釈が異なる全角文字の幅を2に固定"
set expandtab "tabを半角スペースで挿入する"
set smarttab "たぶんバックスペースで半角スペース4つ削除かな?
set tabstop=4 "タブ幅をスペース４つ分"
set shiftwidth=4 "vimが自動で生成するtab幅をスペース4つ分"


"#####インデント#####
syntax on "コードの色分け
set autoindent "オートインデント
set smartindent "改行時などに，自動でインデントを設定してくれる"
filetype plugin indent on "ファイルタイプの自動認識
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


"######ここからプラグイン関係の設定######
"
"#####neoyankの設定#####
"let g:neoyank#limit
"let g:neoyank#file
"let g:neoyank#registers


"#####neocompleteの設定#####
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
            \ 'default' : '',
            \ 'vimshell' : $HOME.'/.vimshell_hist',
            \ 'scheme' : $HOME.'/.gosh_completions'
            \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] ='\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>    neocomplete#undo_completion()
inoremap <expr><C-l>    neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif

if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.python = '\%([^.\t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
let g:neocomplete#sources#omni#input_patterns.python = '\h\w*\|[^. \t]\.\w*'
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:]*\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:]*\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
"let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'


"#####neosnippetの設定#####
" Plugin key-mappings.
imap <C-d>     <Plug>(neosnippet_expand_or_jump)
smap <C-d>     <Plug>(neosnippet_expand_or_jump)
xmap <C-d>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
    set conceallevel=2 concealcursor=niv
endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/dein/repos/github.com/honza/vim-snippets/snippets'

".texはplaintex?として扱われてたみたいなのでlatexに変更
let g:tex_flavor='latex'


"#####jscomplete-vimの設定#####
autocmd FileType javascript
            \ :setl omnifunc=jscomplete#CompleteJS
let g:jscomplete_use = ['dom', 'moz', 'xpcom']


"#####simple-javascript-indenterの設定#####
let g:ShipleJsIndenter_BriefMode = 1
let g:SimpleJsIndenter_CaseIndentLevel = -1


"#####lightline.vimの設定#####
set laststatus=2 "ステータスラインを2行表示
"let g:lightline = {
"            \ 'colorscheme' : 'solarized theme',
"            \}


"#####Molokaiの設定#####
let g:molokai_original = 1
let g:rehash256 = 1


"#####vim-templateの設定#####
" テンプレートの場所を指定する
let g:template_basedir = '~/dotfiles/templates/'
let g:template_files = 'template.*'
let g:template_free_pattern = 'template'
" テンプレート中に含まれる特定文字列を置換する
autocmd MyAutoCmd User plugin-template-loaded call s:template_keywords()
function! s:template_keywords()
    silent! %s/<+FILENAME+>/\=expand('%:r')/g
    silent! %s/<+DATE+>/\=strftime('%c')/g
endfunction
" テンプレート中に含まれる'<+CURSOR+>'にカーソルを移動する
autocmd MyAutoCmd User plugin-template-loaded
            \   if search('<+CURSOR+>')
            \ |     silent! execute 'normal! "_da>'
            \ | endif


"#####jedi-vimの設定#####
autocmd FileType python setlocal completeopt-=preview
autocmd FileType python setlocal omnifunc=jedi#completions

let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#rename_command = "" "quickrunとかぶるのでリネームコマンドを消去

"#####syntasticの設定#####
let g:syntastic_check_on_open=0 "ファイルを開いたときはチェックしない
let g:syntastic_check_on_save=1 "保存時にはチェック
let g:syntastic_check_on_wq = 0 " wqではチェックしない
let g:syntastic_auto_loc_list=1 "エラーがあったら自動でロケーションリストを開く
let g:syntastic_loc_list_height=6 "エラー表示ウィンドウの高さ
"let g:syntastic_enable_signs=1 "?
"let g:syntastic_always_popular_loc_list=1 "ロケーションリストの常時更新をオンに

set statusline+=%#warningmsg# "エラーメッセージの書式
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_javascript_checkers = ['eslint'] "ESLintを使う
"let g:syntastic_python_checkers = ['pylint'] "pylintを使う

"let g:syntastic_mode_map = {
"      \ 'mode': 'active',
"      \ 'active_filetypes': ['javascript'],
"      \ 'passive_filetypes': []
"      \ }


"#####quickrunの設定#####
let g:quickrun_config={'*':{'split':''}}
let g:quickrun_config._={'runner':'vimproc',
            \ "runner/vimproc/updatetime":10,
            \ "outputter/buffer/close_on_empty":1,
            \}


"#####neocompleteのomnifuncの複数指定？#####
if !exists('g:neocomplete_omni_functions')
    let g:neocomplete_omni_functions = {}
endif

let g:neocomplete_omni_functions.javascript = ['javascriptcomplete#CompleteJS', 'jscomplete#CompleteJS']
let g:neocomplete_omni_functions.python = ['pythoncomplete#Complete', 'jedi#completions']
