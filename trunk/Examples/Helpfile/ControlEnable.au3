Run("winver.exe")
$HWND=WinWaitActive('[REGEXPTITLE:.+Windows;REGEXPCLASS:#\d+]','')
If IsHWnd($HWND) Then
	;�Ƚ���
	ControlDisable($HWND, "", "Button1")
	MsgBox(32,$HWND,'ϵͳ���ڴ��ڳ��ֿ�...��������ȷ����ť����')
	ControlEnable($HWND, "", "Button1")
Else
	MsgBox(32,"ERROR","ò��û�ҵ�������...")
EndIf
