'IP�A�h���X�A�V���[�g�J�b�g�̃����N��A�V���[�g�J�b�g�̃p�X���`
Dim ip, targetpath, fil
'Set args = WScript.Arguments
'ip = args.item(0)
'ip = "172.17.180.28"
ip = InputBox("input ipadress of WSL")
'���̓L�����Z�����̓v���O�������I�����鏈��������
If ip = "" Then
  WScript.Quit
End If

targetpath = "\\"+ip+"\wsl-home"

Set shell = WScript.CreateObject("WScript.Shell")
desktopPath = shell.SpecialFolders("Desktop")
fil = desktopPath + "\wsl-home.lnk"

'�Â��V���[�g�J�b�g������΍폜
DelShortcut()

'�V���[�g�J�b�g���쐬
Set shortCut = shell.CreateShortcut(fil)
shortCut.TargetPath = targetpath
shortCut.Save

'���b�Z�[�W�\��
MsgBox("�V���[�g�J�b�g�u"&fil&"�v���쐬���܂����B")



'�Â��V���[�g�J�b�g������΍폜����֐�
Function DelShortcut()
  Set objFS = CreateObject("Scripting.FileSystemObject")
  If objFS.FileExists(fil) Then
    Set objFile = objFS.GetFile(fil)
    objFile.delete
  End If
End Function
