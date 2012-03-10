#include <GuiMenu.au3>

_Main()

Func _Main()
	Local $hWnd, $hMain, $hFile

	; �򿪼��±�
	Run("notepad.exe")
	WinWaitActive("[CLASS:Notepad]")
	$hWnd = WinGetHandle("[CLASS:Notepad]")
	$hMain = _GUICtrlMenu_GetMenu($hWnd)
	$hFile = _GUICtrlMenu_GetItemSubMenu($hMain, 0)

	; Get/Set Open command ID
	Writeln("Open command ID: " & _GUICtrlMenu_GetItemID($hFile, 1))
	_GUICtrlMenu_SetItemID($hFile, 1, 0)
	Writeln("Open command ID: " & _GUICtrlMenu_GetItemID($hFile, 1))

EndFunc   ;==>_Main

; д��һ���ı������±�
Func Writeln($sText)
	ControlSend("[CLASS:Notepad]", "", "Edit1", $sText & @CR)
EndFunc   ;==>Writeln
