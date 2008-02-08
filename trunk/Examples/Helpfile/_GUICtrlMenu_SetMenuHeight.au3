#include <GuiMenu.au3>

Opt('MustDeclareVars', 1)

_Main()

Func _Main()
	Local $hWnd, $hMain, $hFile

	; Open Notepad
	Run("Notepad.exe")
	WinWaitActive("Untitled - Notepad")
	$hWnd = WinGetHandle("Untitled - Notepad")
	$hMain = _GUICtrlMenu_GetMenu ($hWnd)
	$hFile = _GUICtrlMenu_GetItemSubMenu ($hMain, 0)

	; Get/Set File menu max height
	Writeln("File menu max height: " & _GUICtrlMenu_GetMenuHeight ($hFile))
	_GUICtrlMenu_SetMenuHeight ($hFile, 100)
	Writeln("File menu max height: " & _GUICtrlMenu_GetMenuHeight ($hFile))

EndFunc   ;==>_Main

; Write a line of text to Notepad
Func Writeln($sText)
	ControlSend("Untitled - Notepad", "", "Edit1", $sText & @CR)
EndFunc   ;==>Writeln