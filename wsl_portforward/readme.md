- 使い方：runme_by_root.batを管理者権限で実行する
- ポートフォーワードの設定を確認するには、以下のコマンドを実行する
```
netsh interface portproxy show v4tov4
```

- ポートフォワードの設定を削除するには、以下のコマンドを実行する
```
rem netsh interface portproxy delete v4tov4 listenport=<ポート番号> listenaddress=<IPアドレス>
```

