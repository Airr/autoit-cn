Run("winver.exe")
$HWND=WinWaitActive('[REGEXPTITLE:.+Windows;REGEXPCLASS:#\d+]','')
If IsHWnd($HWND) Then
	MsgBox(32,$HWND,'ϵͳ���ڴ��ڳ��ֿ�...')
	ControlClick(HWnd($HWND), "", "Button1")
Else
	MsgBox(32,"ERROR","ò��û�ҵ�������...")
EndIf