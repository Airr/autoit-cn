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

	; Get/Set File menu data
	Writeln("File data: " & _GUICtrlMenu_GetMenuData ($hFile))
	_GUICtrlMenu_SetMenuData ($hFile, 1234)
	Writeln("File data: " & _GUICtrlMenu_GetMenuData ($hFile))

EndFunc   ;==>_Main

; Write a line of text to Notepad
Func Writeln($sText)
	ControlSend("Untitled - Notepad", "", "Edit1", $sText & @CR)
EndFunc   ;==>Writeln