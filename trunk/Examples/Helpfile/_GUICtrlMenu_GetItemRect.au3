#include <GuiMenu.au3>

Opt('MustDeclareVars', 1)

_Main()

Func _Main()
	Local $hWnd, $hMain, $aRect

	; Open Notepad
	Run("Notepad.exe")
	WinWaitActive("Untitled - Notepad")
	$hWnd = WinGetHandle("Untitled - Notepad")
	$hMain = _GUICtrlMenu_GetMenu ($hWnd)

	; Get File menu rectangle
	$aRect = _GUICtrlMenu_GetItemRect ($hWnd, $hMain, 0)

	Writeln("File X1: " & $aRect[0])
	Writeln("File Y1: " & $aRect[1])
	Writeln("File X2: " & $aRect[2])
	Writeln("File Y2: " & $aRect[3])

EndFunc   ;==>_Main

; Write a line of text to Notepad
Func Writeln($sText)
	ControlSend("Untitled - Notepad", "", "Edit1", $sText & @CR)
EndFunc   ;==>Writeln