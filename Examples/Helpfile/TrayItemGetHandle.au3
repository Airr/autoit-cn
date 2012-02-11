#NoTrayIcon

Opt("TrayMenuMode", 3) ; Ĭ�ϲ˵���Ŀ (�ű���ͣ��/�˳�)(Script Paused/Exit) ��������ʾ,������ѡ��Ŀ���ܱ�ѡ��(checkbox�����) . ��ο�TrayMenuModeѡ��1��2(3=1+2).

Global Const $MIM_APPLYTOSUBMENUS = 0x80000000, $MIM_BACKGROUND = 0x00000002 ; Constants required for SetMenuColor

Example()

Func Example()
	Local $iSettings = TrayCreateMenu("����") ; Create a tray menu sub menu with two sub items.
	Local $iDisplay = TrayCreateItem("��ʾ", $iSettings)
	Local $iPrinter = TrayCreateItem("��ӡ", $iSettings)
	TrayCreateItem("") ; Create a separator line.

	Local $iAbout = TrayCreateItem("����")
	TrayCreateItem("") ; Create a separator line.

	Local $iExit = TrayCreateItem("�˳�����")

	TraySetState(1) ; Show the tray menu.

	SetMenuColor(0, 0xEEBB99)   ; BGR ��ɫֵ, '0' ����˼�����̹����˵��Լ�.
	SetMenuColor($iSettings, 0x66BB99); BGR ��ɫֵ

	While 1
		Switch TrayGetMsg()
			Case $iAbout ; Display a message box about the AutoIt version and installation path of the AutoIt executable.
				MsgBox(4096, "", "�������̲˵�����." & @CRLF & @CRLF & _
						"����汾: " & @AutoItVersion & @CRLF & _
						"��װ·��: " & StringLeft(@AutoItExe, StringInStr(@AutoItExe, "\", 0, -1) - 1)) ; Find the folder of a full path.

			Case $iDisplay, $iPrinter
				MsgBox(4096, "", "A sub menu item was selected from the tray menu.")

			Case $iExit ; Exit the loop.
				ExitLoop
		EndSwitch
	WEnd
EndFunc   ;==>Example

; Ӧ�ò˵���ɫ
Func SetMenuColor($iMenuID, $iColor)
	Local $hMenu  = TrayItemGetHandle($iMenuID) ; �õ��ڲ��˵����

	Local $hBrush = DllCall("gdi32.dll", "hwnd", "CreateSolidBrush", "int", $iColor)
	$hBrush = $hBrush[0]

	Local $tMenuInfo = DllStructCreate("dword;dword;dword;uint;ptr;dword;ptr")
	DllStructSetData($tMenuInfo, 1, DllStructGetSize($tMenuInfo))
	DllStructSetData($tMenuInfo, 2, BitOR($MIM_APPLYTOSUBMENUS, $MIM_BACKGROUND))
	DllStructSetData($tMenuInfo, 5, $hBrush)

	DllCall("user32.dll", "int", "SetMenuInfo", "hwnd", $hMenu, "ptr", DllStructGetPtr($tMenuInfo))
EndFunc   ;==>SetMenuColor
