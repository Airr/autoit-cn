Run("winver.exe")
$HWND=WinWaitActive('[REGEXPTITLE:.+Windows;REGEXPCLASS:#\d+]','')
If IsHWnd($HWND) Then
	MsgBox(32,$HWND,'ϵͳ���ڴ��ڳ��ֿ�...�����ƶ�ȷ����ť����')
	ControlMove($HWND, "", "Button1",20,40)
Else
	MsgBox(32,"ERROR","ò��û�ҵ�������...")
EndIf
