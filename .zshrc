#zshのインタラクティブシェルを起動した際に読み込まれる設定ファイル
#zshスクリプトを実行したり、zsh -c 'command ...'では読み込まれない
#主にzshの操作に関する設定を記述

#viライクな操作を有効にする
bindkey -v

#カラーを使用できるようにする
autoload -Uz colors
colors
local DEFAULT=%{$reset_color%}
local RED=%{$fg[red]%}
local GREEN=%{$fg[green]%}
local YELLOW=%{$fg[yellow]%}
local BLUE=%{$fg[blue]%}
local PURPLE=%{$fg[purple]%}
local CYAN=%{$fg[cyan]%}
local WHITE=%{$fg[white]%}

#自動補完を有効
fpath=(/usr/local/share/zsh-completions $fpath)
autoload -U compinit; compinit -u

#beepを無効にする
setopt no_beep


####各種エイリアス####
#接尾辞エイリアス
alias -s pdf=open
alias -s png=open
alias -s jpg=open
alias -s txt=less
alias -s html=open

#emacs嫌い
alias emacs=sl
alias vi=vim

#ついでに二つ前、三つ前に戻る設定を付加
alias ...='cd ../..'
alias ....='cd ../../..'

#グローバルエイリアス
alias -g @g='| grep'
alias -g @x='| xargs'

#Cellarへの移動
setopt CDABLE_VARS
hash -d Cellar=/usr/local/Cellar

####ヒストリの設定####
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

HISTTIMEFORMAT="[%Y/%M/%D %H:%M:%S] "


####補完に関するオプション####
setopt auto_param_slash #ディレクトリ名の補完で末尾の/を自動的に付加
setopt mark_dirs #ファイル名の展開でディレクトリにマッチした場合、末尾に/を付加
setopt list_types #補完候補一覧でファイルの識別をマーク表示 (ls -F)
setopt auto_menu #候補キー連打で順に補完候補を自動で補完
setopt auto_param_keys #カッコの対応などを自動的に補完
setopt interactive_comments #コマンドラインでも#以降をコメントとみなす
setopt magic_equal_subst #コマンドラインの因数で=以降でも補完できる

setopt complete_in_word #語の途中でもカーソル位置で補完
setopt always_last_prompt #カーソル位置は保持したままファイル名一覧をその場で表示

setopt print_eight_bit #日本語ファイル名等8bitを通す

#拡張globを有効にする
#どういう意味を持つかは'man zshexpn'の'FILENAME GENERATION'を参照
setopt extended_glob
setopt globdots #明確なドットの指定なしで.から始まるファイルをマッチ

bindkey "^I" menu-complete #展開する前に補完候補を出させる

#<tab>でパス名の補完候補を表示したあと、
#移動キーを押すと候補からパス名を選択できる
zstyle ':completion:*:default' menu select=2


####カラー表示####
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
export LSCOLORS=cxfxcxdxbxegedabagacad
alias ls="ls -G"
zstyle ':completion:*' list-colors 'di=33' 'ln=35' 'so=04' 'ex=32' 'bd=46;34' 'cd=43;34'


####ディレクトリ移動関連####
#入力したコマンドが存在せず、かつディレクトリ名と一致するならディレクトリにcd
setopt auto_cd

#cdした先のディレクトリをディレクトリスタックに追加する
#'cd + <tab>'でディレクトリの履歴が表示され、そこに移動できる
setopt auto_pushd

#pushdしたときディレクトリがすでにスタックに積まれていれば追加にしない
setopt pushd_ignore_dups


####コマンド関連####
#入力したコマンドがすでにコマンド履歴に含まれる場合,履歴から古い方のコマンドを削除する
setopt hist_ignore_all_dups

#コマンドがスペースで始まる場合、コマンド履歴に追加しない
setopt hist_ignore_space

#コマンド訂正機能
SPROMPT="correct: $RED%R$DEFAULT -> $GREEN%r$DEFAULT ? [No/Yes/Abort/Edit]"
setopt correct


####prompt2の設定?右側のプロンプトの設定####
autoload -Uz add-zsh-hook
# autoload -U promptinit; promptinit
autoload -Uz vcs_info
autoload -Uz is-at-least

# begin VCS
zstyle ":vcs_info:*" enable git svn hg bzr
zstyle ":vcs_info:*" formats "(%s)-[%b]"
zstyle ":vcs_info:*" actionformats "(%s)-[%b|%a]"
zstyle ":vcs_info:(svn|bzr):*" branchformat "%b:r%r"
zstyle ":vcs_info:bzr:*" use-simple true

zstyle ":vcs_info:*" max-exports 6

if is-at-least 4.3.10; then
    zstyle ":vcs_info:git:*" check-for-changes true # commitしていないのをチェック
    zstyle ":vcs_info:git:*" stagedstr "<S>"
    zstyle ":vcs_info:git:*" unstagedstr "<U>"
    zstyle ":vcs_info:git:*" formats "(%b) %c%u"
    zstyle ":vcs_info:git:*" actionformats "(%s)-[%b|%a] %c%u"
fi

# end VCS

# PROMPT="$GREEN%m$DEFAULT:$CYAN%n$DEFAULT%% "
PROMPT="%B$GREEN%n$DEFAULT%b@%B$CYAN%m$DEFAULT%b "

function _update_vcs_info_msg() {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

RPROMPT="["
RPROMPT+="$BLUE%~%f$DEFAULT"
add-zsh-hook precmd _update_vcs_info_msg
RPROMPT+="%1(v|%F{green}%1v%f|)"
RPROMPT+="]"



