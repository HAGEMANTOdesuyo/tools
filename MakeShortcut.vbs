'IPアドレス、ショートカットのリンク先、ショートカットのパスを定義
Dim ip, targetpath, fil
'Set args = WScript.Arguments
'ip = args.item(0)
'ip = "172.17.180.28"
ip = InputBox("input ipadress of WSL")
'入力キャンセル時はプログラムを終了する処理を書く
If ip = "" Then
  WScript.Quit
End If

targetpath = "\\"+ip+"\wsl-home"

Set shell = WScript.CreateObject("WScript.Shell")
desktopPath = shell.SpecialFolders("Desktop")
fil = desktopPath + "\wsl-home.lnk"

'古いショートカットがあれば削除
DelShortcut()

'ショートカットを作成
Set shortCut = shell.CreateShortcut(fil)
shortCut.TargetPath = targetpath
shortCut.Save

'メッセージ表示
MsgBox("ショートカット「"&fil&"」を作成しました。")



'古いショートカットがあれば削除する関数
Function DelShortcut()
  Set objFS = CreateObject("Scripting.FileSystemObject")
  If objFS.FileExists(fil) Then
    Set objFile = objFS.GetFile(fil)
    objFile.delete
  End If
End Function
