#NoTrayIcon
#include <Constants.au3> ; Required for the $TRAY_EVENT_PRIMARYDOUBLE and $TRAY_EVENT_SECONDARYUP constants.

Opt("TrayMenuMode", 3) ; Ĭ�ϲ˵���Ŀ (�ű���ͣ��/�˳�)(Script Paused/Exit) ��������ʾ,������ѡ��Ŀ���ܱ�ѡ��(checkbox�����) . ��ο�TrayMenuModeѡ��1��2(3=1+2).
Opt("TrayOnEventMode", 1)

Example()

Func Example()
	TrayCreateItem("����")

	TrayCreateItem("") ; Create a separator line.

	TrayCreateItem("�˳�")
	TrayItemSetOnEvent(-1, "ExitScript")

	TraySetOnEvent($TRAY_EVENT_PRIMARYDOUBLE, "TrayEvent")
	TraySetOnEvent($TRAY_EVENT_SECONDARYUP, "TrayEvent")

	TraySetState(1) ; Show the tray menu.

	While 1
		Sleep(100)	; ����ѭ��
	WEnd
EndFunc   ;==>Example

Func TrayEvent()
	Switch @TRAY_ID ; Check the last tray item identifier.
		Case $TRAY_EVENT_PRIMARYDOUBLE
			; Display a message box about the AutoIt version and installation path of the AutoIt executable.
			MsgBox(4096, "", "AutoIt tray menu example." & @CRLF & @CRLF & _
					"Version: " & @AutoItVersion & @CRLF & _
					"Install Path: " & StringLeft(@AutoItExe, StringInStr(@AutoItExe, "\", 0, -1) - 1)) ; Find the folder of a full path.

		Case $TRAY_EVENT_SECONDARYUP
			MsgBox(4096, "", "The secondary mouse button was released on the tray icon.")

	EndSwitch
EndFunc   ;==>TrayEvent

Func ExitScript()
	Exit
EndFunc   ;==>ExitScript
