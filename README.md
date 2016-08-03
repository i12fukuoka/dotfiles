# dotfiles
vim，zsh，dotfilesです.  
.toml未作成，又プラグインは未設定のものもあるので要修正.  


## *lua付きvimのインストール
neocompleteを使用するためにはlua付きvimのインストールが必要になる.  

`$brew install vim --with-lua`


## *ローカルへのvimのインストール
業務上，管理者権限が与えられていない場合vimのupgradeは面倒なものになる.  
brewをローカルにインストールすることで解決を図る方法メモ書き.

#### ローカルへbrewをインストール

* /opt/homebrew ディレクトリの作成.  

```shell:mkdir
$mkdir -p ~/opt/hombrew  
$cd ~/opt  
$chown ${USER}:staff homebrew  
```

* brew のインストール.  
```shell:install
$curl -L https://github.com/Homebrew/homebrew/tarball/master | tar xz --strip *-C homebrew
```

* 実行パスの設定.  
```shell:pass
$export PATH=~/opt/homebrew/bin:$PATH  
```

* キャッシュパスの設定.  
```shell:pash
export HOMEBREW_CACHE=~/opt/homebrew/cache  
```
