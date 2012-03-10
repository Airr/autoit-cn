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

	; Get/Set File menu default item
	Writeln("File menu default item: " & _GUICtrlMenu_GetMenuDefaultItem($hFile))
	_GUICtrlMenu_SetMenuDefaultItem($hFile, 1)
	Writeln("File menu default item: " & _GUICtrlMenu_GetMenuDefaultItem($hFile))

EndFunc   ;==>_Main

; д��һ���ı������±�
Func Writeln($sText)
	ControlSend("[CLASS:Notepad]", "", "Edit1", $sText & @CR)
EndFunc   ;==>Writeln
