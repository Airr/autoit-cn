; ���ÿ�ݷ�ʽ�ȼ�: ctrl+alt+t
FileCreateShortcut(@WindowsDir & "\Explorer.exe", @DesktopDir & "\Shortcut Test.lnk", @WindowsDir, "/e,c:\", "This is an Explorer link;-)", @SystemDir & "\shell32.dll", "^!t", "15", @SW_MINIMIZE)

; ��ȡ��ݷ�ʽ·��
Local $details = FileGetShortcut(@DesktopDir & "\Shortcut Test.lnk")
MsgBox(0, "·��:", $details[0])
