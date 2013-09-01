#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Create a GUI with various controls.
	Local $hGUI = GUICreate("Example", 300, 200)

	; Create a combobox control.
	Local $iComboBox = GUICtrlCreateCombo("Item 1", 10, 10, 185, 20)
	Local $iClose = GUICtrlCreateButton("Close", 210, 170, 85, 25)

	; Add additional items to the combobox.
	GUICtrlSetData($iComboBox, "Item 2|Item 3", "Item 2")

	; Display the GUI.
	GUISetState(@SW_SHOW, $hGUI)

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE, $iClose
				ExitLoop

			Case $iComboBox
				Local $sComboRead = GUICtrlRead($iComboBox)
				MsgBox($MB_SYSTEMMODAL, "", "The combobox is currently displaying: " & $sComboRead, 0, $hGUI)

		EndSwitch
	WEnd

	; Delete the previous GUI and all controls.
	GUIDelete($hGUI)
EndFunc   ;==>Example
