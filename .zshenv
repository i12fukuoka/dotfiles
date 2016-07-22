#zshが起動した際に必ず読み込まれる設定ファイル
#環境変数等の主に操作に関係のない設定を記述

#PATHの設定
NEO4J_HOME=/usr/local/Cellar/neo4j/3.0.3/libexec
JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_40.jdk/Contents/Home
M2_HOME=/usr/local/Cellar/maven32/3.2.5/libexec
PATH=$PATH:~/prog:~/neo4j:$NEO4J_HOME:$M2_HOME

# プロキシ設定
USERNAME = "i12fukuoka"
PASSWORD = "Bbhjku2092"
http_proxy=http://$USERNAME:PASSWORD@ccfw2.tokuyama.ac.jp:8080
https_proxy=$http_proxy
HTTP_PROXY=$http_proxy
HTTPS_PROXY=$http_proxy

#CLASSPATHの設定
