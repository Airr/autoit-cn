#NoTrayIcon

Opt("TrayMenuMode", 3) ; Ĭ�ϲ˵���Ŀ (�ű���ͣ��/�˳�)(Script Paused/Exit) ��������ʾ,������ѡ��Ŀ���ܱ�ѡ��(checkbox�����) . ��ο�TrayMenuModeѡ��1��2(3=1+2).
Opt("TrayOnEventMode", 1)

Example()

Func Example()
	TrayCreateItem("����")
	TrayItemSetOnEvent(-1, "����")

	TrayCreateItem("") ; Create a separator line.

	TrayCreateItem("�˳�")
	TrayItemSetOnEvent(-1, "ExitScript")

	TraySetState(1) ; Show the tray menu.

	While 1
		Sleep(100)	; ����ѭ��
	WEnd
EndFunc   ;==>Example

Func About()
	; Display a message box about the AutoIt version and installation path of the AutoIt executable.
	MsgBox(4096, "", "AutoIt tray menu example." & @CRLF & @CRLF & _
			"Version: " & @AutoItVersion & @CRLF & _
			"Install Path: " & StringLeft(@AutoItExe, StringInStr(@AutoItExe, "\", 0, -1) - 1)) ; Find the folder of a full path.
EndFunc   ;==>About

Func ExitScript()
	Exit
EndFunc   ;==>ExitScript
