"定番の初期化作業

"ウィンドウズはウィンドウズ
let s:is_windows = has('win32') || has('win64')

function! IsWindows() abort
    return s:is_windows
endfunction

"MacはMac
function! IsMax() abort
    return !s:is_windows && !has('win32unix')
        \ && (has('mac') || has('macunix') || has('gui_macvim')
        \   || (!executable('xdg_open') && system(uname) =~? '^darwin'))
endfunction

"文字コードはたいていutf-8にする
if has('vim_starting') && &encoding !=# 'utf-8'
    if IsWindows() && !has('gui_running')
        set encoding=cp932
    else
        set encoding=utf-8
    endif
endif

"読み込める文字コードは色々設定しとく
"let &fileencodings = join(['ucs-bom', 'iso-2022-jp-3', 'euc-jp', 'utf-8', 'cp932'])
set fileencodings=ucs-bom,iso-2022-jp-3,euc-jp,utf-8,cp932

"ウィンドウズでの端末の出力は変えねば
if !has('gui_runnnig') && IsWindows()
    set termencoding=cp932
endif

"勝手に日本語入力になられても困るので
if has('multi_byte_ime')
    set iminsert=0 imsearch=-
endif

"ウィンドウズのパスをどうにか
if IsWindows()
    set shellslash
endif

"キャッシュの定義も行っとくよ
"なきゃ作る
let $CACHE = empty($XDG_CACHE_HOME) ? expand('$HOME/.cache') : $XDG_CACHE_HOME
if !isdirectory(expand($CACHE))
    call mkdir(expand($CACHE), 'p')
endif

"現在のディレクトリにdein.vimはあるか
"substitute(ソース文字列, 置換基パターン，置換文字列，フラグ)
let s:dein_dir = finddir('dein.vim', '.;')
"dein_dirをruntimepathに登録
if s:dein_dir != '' || &runtimepath !~ '/dein.vim'                                      "dein.vimがカレントにないか，runtimepathにdein.vimがない場合
    if s:dein_dir == '' && &runtimepath !~ '/dein.vim'                                  "dein.vimがカレントになく，又runtimepathにもない場合
        let s:dein_dir = expand('$CACHE/dein') . '/repos/github.com/Shougo/dein.vim'    "dein.vim用のパスを直接指定する
        if !isdirectory(s:dein_dir)                                                     "dein.vimがなければcloneしてくる
            execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
        endif
    endif
    execute 'set runtimepath^=' . substitute(fnamemodify(s:dein_dir, ':p'), '/$', '', '')
endif

set runtimepath^=~/.cache/dein/repos/github.com/Shougo/dein.vim



