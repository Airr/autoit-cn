; ���ÿ�ݷ�ʽ�ȼ�: ctrl+alt+t
FileCreateShortcut(@WindowsDir & "\Explorer.exe", @DesktopDir & "\��ݷ�ʽ����.lnk", @WindowsDir, "/e,c:\", "����һ����Դ�������Ŀ�ݷ�ʽ;-)", @SystemDir & "\shell32.dll", "^!t", "15", @SW_MINIMIZE)

; ��ȡ��ݷ�ʽ·��
Local $details = FileGetShortcut(@DesktopDir & "\��ݷ�ʽ����.lnk")
MsgBox(0, "·��:", $details[0])
