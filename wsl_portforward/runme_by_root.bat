@echo off
rem ----------------------------------------------------------------------------
rem 管理者権限で実行すること
rem ----------------------------------------------------------------------------
rem このバッチファイルが置いてあるディレクトリへ移動
rem
set bat=wsl_portforward_called.bat
wsl ./makebat.sh
call .\%bat%
del .\%bat%
pause
