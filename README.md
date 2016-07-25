# dotfiles
vim，zsh，dotfilesです.  
.toml未対応，又プラグインは未設定のものもあるので要修正.  


## lua付きvimのインストール
neocompleteを使用するためにはlua付きvimのインストールが必要になる.
  

***
$brew install vim --with-lua
***


dotfilesです.
vim，zsh，latexmrに対応.
vimのプラグイン管理は.toml未対応，又，未設定のものもあるので要修正.


## ローカルへのvimのインストール

業務上，管理者権限が与えられていない場合vimのupgradeは面倒なものになるのでメモ書き.  

#### ローカルへbrewをインストール
/opt/homebrew ディレクトリの作成.

***
$mkdir -p ~/opt/hombrew
$cd ~/opt
$chown ${USER}:staff homebrew
***

brew のインストール.  

***
$curl -L https://github.com/Homebrew/homebrew/tarball/master | tar xz --strip 1 -C homebrew
***

実行パスの設定.  
***
$export PATH=$PATH:~/opt/homebrew/bin
***

キャッシュパスの設定.  
***
export HOMEBREW_CACHE=~/opt/homebrew/cache
***
