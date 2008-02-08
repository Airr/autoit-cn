#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Opt('MustDeclareVars', 1)

Global $gui, $guiPos, $pic, $picPos

Example1()
Example2()

;----- example 1 ----
Func Example1()
	Local $n, $msg
	
	GUICreate("My GUI picture", 350, 300, -1, -1, $WS_SIZEBOX + $WS_SYSMENU)  ; will create a dialog box that when displayed is centered

	GUISetBkColor(0xE0FFFF)
	$n = GUICtrlCreatePic(@SystemDir & "\oobe\images\mslogo.jpg", 50, 50, 200, 50)

	GUISetState()

	; Run the GUI until the dialog is closed
	While 1
		$msg = GUIGetMsg()
		
		If $msg = $GUI_EVENT_CLOSE Then ExitLoop
	WEnd


;~ GUISetState ()
	; resize the control
	$n = GUICtrlSetPos($n, 50, 50, 200, 100)
	; Run the GUI until the dialog is closed
	While 1
		$msg = GUIGetMsg()
		
		If $msg = $GUI_EVENT_CLOSE Then ExitLoop
	WEnd
	
	GUIDelete()
EndFunc   ;==>Example1

;----- example 2
Func Example2()
	Local $msg
	
	$gui = GUICreate("test transparentpic", 200, 100)
	$pic = GUICreate("", 68, 71, 10, 10, $WS_POPUP, BitOR($WS_EX_LAYERED, $WS_EX_MDICHILD), $gui)
	GUICtrlCreatePic(@SystemDir & "\oobe\images\merlin.gif", 0, 0, 0, 0)

	GUISetState(@SW_SHOW, $pic)
	GUISetState(@SW_SHOW, $gui)

	HotKeySet("{ESC}", "main")
	HotKeySet("{LEFT}", "left")
	HotKeySet("{RIGHT}", "right")
	HotKeySet("{DOWN}", "down")
	HotKeySet("{UP}", "up")
	$picPos = WinGetPos($pic)
	$guiPos = WinGetPos($gui)

	Do
		$msg = GUIGetMsg()
	Until $msg = $GUI_EVENT_CLOSE
EndFunc   ;==>Example2

Func main()
	$guiPos = WinGetPos($gui)
	WinMove($gui, "", $guiPos[0] + 10, $guiPos[1] + 10)
EndFunc   ;==>main

Func left()
	$picPos = WinGetPos($pic)
	WinMove($pic, "", $picPos[0] - 10, $picPos[1])
EndFunc   ;==>left

Func right()
	$picPos = WinGetPos($pic)
	WinMove($pic, "", $picPos[0] + 10, $picPos[1])
EndFunc   ;==>right

Func down()
	$picPos = WinGetPos($pic)
	WinMove($pic, "", $picPos[0], $picPos[1] + 10)
EndFunc   ;==>down

Func up()
	$picPos = WinGetPos($pic)
	WinMove($pic, "", $picPos[0], $picPos[1] - 10)
EndFunc   ;==>up