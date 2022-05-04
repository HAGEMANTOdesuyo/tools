- .bashrcから.bashrc_wslを読み込む設定
```
if [ -f ~/.bashrc_wsl ]; then
    . ~/.bashrc_wsl
fi
```
