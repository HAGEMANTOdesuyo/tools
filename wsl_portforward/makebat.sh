#!/bin/sh

# 変数定義
bat=wsl_portforward_called.bat
tmp=$(mktemp)

# IPアドレスの取得
/mnt/c/Windows/System32/ipconfig.exe | grep -B5 -E '192.168.10.1' | grep 'IPv4' | awk '{print $14}' | tr -d \\r > $tmp
ip_win=$(cat $tmp)
ip addr show | grep 'eth0' | grep 'inet' | awk '{print $2}' | tr '/' ' ' |awk '{print $1}' > $tmp
ip_wsl=$(cat $tmp)

rm $tmp # tmpファイルの削除

#echo $ip_win
#echo $ip_wsl


# バッチファイル出力
echo \
netsh interface portproxy add v4tov4 listenaddress=$ip_win listenport=8080 connectaddress=$ip_wsl connectport=8080\
> $bat
echo netsh interface portproxy show v4tov4 >> $bat
