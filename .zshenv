#zshが起動した際に必ず読み込まれる設定ファイル
#環境変数等の主に操作に関係のない設定を記述

#PATHの設定
export NEO4J_HOME=/usr/local/Cellar/neo4j/3.0.3/libexec
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_40.jdk/Contents/Home
export M2_HOME=/usr/local/Cellar/maven32/3.2.5/libexec
export PATH=$PATH:~/prog:~/neo4j:$NEO4J_HOME:$M2_HOME

#CLASSPATHの設定
