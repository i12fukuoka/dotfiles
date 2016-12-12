"dein用vimrc

let g:dein#install_progress_type = 'title'
let g:dein#install_message_type = 'none'
let g:dein#enable_notification = 1
"let g:dein#notification_icon = ''

let s:path = expand('$CACHE/dein')

"if the cache script is old or ivalid or not found, this is finished
if !dein#load_state(s:path)
    finish
endif

"同じディレクトリに.toml置いているはずなので第二引数は<sfile>
call dein#begin(s:path, expand('<sfile>'))

"tomlファイルのロード
call dein#load_toml('$HOME/.vim/rc/dein.toml', {'lazy': 0})
call dein#load_toml('$HOME/.vim/rc/dein_lazy.toml', {'lazy': 1})

"nvim用のtomlファイル
if has('nvim')
    call dein#load_toml('$HOME/.vim/rc/deineo.toml', {})
endif

"call dein#load_toml('$HOME/.vim/rc/deinft.toml')

"neocompleteはlua依存なのでnvimでは使用しない
if dein#tap('deoplete.nvim') && has('nvim')
    call dein#disable('neocomplete.vim')
endif

call dein#end()
call dein#save_state()

if has('vim_starting') && dein#check_install()
    call dein#install()
endif
