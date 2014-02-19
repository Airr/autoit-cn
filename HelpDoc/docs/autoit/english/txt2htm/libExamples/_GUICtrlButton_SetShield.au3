#include <GuiButton.au3>
#include <GUIConstantsEx.au3>
#include <GuiMenu.au3>
#include <WindowsConstants.au3>

Global $btn, $btn2

; Note the controlID from these buttons can NOT be read with GUICtrlRead

Example()

Func Example()
	Local $hGUI

	$hGUI = GUICreate("Buttons", 400, 400)

	$btn = _GUICtrlButton_Create($hGUI, "Button1", 10, 10, 90, 30)
	_GUICtrlButton_SetShield($btn)

	$btn2 = _GUICtrlButton_Create($hGUI, "Button2", 10, 60, 90, 30, $BS_SPLITBUTTON)
	_GUICtrlButton_SetShield($btn2)

	GUISetState(@SW_SHOW)

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd

	Exit
EndFunc   ;==>Example
