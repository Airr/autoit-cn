#NoTrayIcon

Example()

Func Example()
	TraySetState(1) ; Show the tray menu.
	TraySetToolTip("An example of a tray menu tooltip.") ; ������һ���µ����̹�����ʾ�ı�!

	While 1
	Sleep(100)	; ����ѭ��
	WEnd
EndFunc   ;==>Example

