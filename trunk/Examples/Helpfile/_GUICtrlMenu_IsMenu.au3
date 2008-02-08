#include <GuiMenu.au3>

Opt('MustDeclareVars', 1)

_Main()

Func _Main()
	Local $hWnd, $hMain

	; Open Notepad
	Run("Notepad.exe")
	WinWaitActive("Untitled - Notepad")
	$hWnd = WinGetHandle("Untitled - Notepad")
	$hMain = _GUICtrlMenu_GetMenu ($hWnd)
	
	; Check return value
	Writeln("Is Menu: " & _GUICtrlMenu_IsMenu ($hWnd))
	Writeln("Is Menu: " & _GUICtrlMenu_IsMenu ($hMain))

EndFunc   ;==>_Main

; Write a line of text to Notepad
Func Writeln($sText)
	ControlSend("Untitled - Notepad", "", "Edit1", $sText & @CR)
EndFunc   ;==>Writeln