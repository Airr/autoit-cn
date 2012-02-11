#NoTrayIcon

Opt("TrayMenuMode", 3) ; Ĭ�ϲ˵���Ŀ (�ű���ͣ��/�˳�)(Script Paused/Exit) ��������ʾ,������ѡ��Ŀ���ܱ�ѡ��(checkbox�����) . ��ο�TrayMenuModeѡ��1��2(3=1+2).

Example()

Func Example()
	Local $iFlash = TrayCreateItem("��˸ͼ��")
	TrayCreateItem("") ; Create a separator line.

	Local $iAbout = TrayCreateItem("����")
	TrayCreateItem("") ; Create a separator line.

	Local $iExit = TrayCreateItem("�˳�")

	TraySetState(1) ; Show the tray menu.

	While 1
		Switch TrayGetMsg()
			Case $iAbout ; Display a message box about the AutoIt version and installation path of the AutoIt executable.
				MsgBox(4096, "", "AutoIt tray menu example." & @CRLF & @CRLF & _
						"Version: " & @AutoItVersion & @CRLF & _
						"Install Path: " & StringLeft(@AutoItExe, StringInStr(@AutoItExe, "\", 0, -1) - 1)) ; Find the folder of a full path.

			Case $iFlash
				; Start flashing the tray icon.
				TraySetState(4)
				Sleep(5000) ; Wait for 5 seconds.
				; Stop flashing the tray icon.
				TraySetState(8)

			Case $iExit ; Exit the loop.
				ExitLoop
		EndSwitch
	WEnd
EndFunc   ;==>Example
