Run("winver.exe")
$HWND=WinWaitActive('[REGEXPTITLE:.+Windows;REGEXPCLASS:#\d+]','')
If IsHWnd($HWND) Then
	;������
	ControlHide($HWND, "", "Button1")
	MsgBox(32,$HWND,'ϵͳ���ڴ��ڳ��ֿ�...������ʾȷ����ť����')
	ControlShow($HWND, "", "Button1")
Else
	MsgBox(32,"ERROR","ò��û�ҵ�������...")
EndIf