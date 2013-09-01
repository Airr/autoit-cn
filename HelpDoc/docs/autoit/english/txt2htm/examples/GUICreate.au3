#include <GUIConstantsEx.au3>

Example()

Func Example()
	; Create a GUI with various controls.
	Local $hGUI = GUICreate("Example")
	Local $iOK = GUICtrlCreateButton("OK", 310, 370, 85, 25)

	; Display the GUI.
	GUISetState(@SW_SHOW, $hGUI)

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE, $iOK
				ExitLoop

		EndSwitch
	WEnd

	; Delete the previous GUI and all controls.
	GUIDelete($hGUI)
EndFunc   ;==>Example
