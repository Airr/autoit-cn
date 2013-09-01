#include <GuiComboBox.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hCombo

	; Create GUI
	GUICreate("ComboBox Get Top Index", 400, 296)
	$hCombo = GUICtrlCreateCombo("", 2, 2, 396, 296, BitOR($CBS_SIMPLE, $CBS_DISABLENOSCROLL, $WS_VSCROLL))
	GUISetState()

	; Add files
	_GUICtrlComboBox_BeginUpdate($hCombo)
	_GUICtrlComboBox_AddDir($hCombo, @WindowsDir & "\*.exe")
	_GUICtrlComboBox_EndUpdate($hCombo)

	; Set Top Index
	_GUICtrlComboBox_SetTopIndex($hCombo, 10)

	; Get Top Index
	MsgBox($MB_SYSTEMMODAL, "Information", "Top Index:" & @TAB & _GUICtrlComboBox_GetTopIndex($hCombo))

	; Loop until user exits
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
