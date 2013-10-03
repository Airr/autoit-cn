#include <GUIConstantsEx.au3>
#include <GuiDateTimePicker.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hGUI, $HandleBefore, $hDTP

	; Create GUI
	$hGUI = GUICreate("(UDF Created) DateTimePick Destroy", 400, 300)
	$hDTP = _GUICtrlDTP_Create($hGUI, 2, 6, 190)
	GUISetState()

	MsgBox($MB_SYSTEMMODAL, "Information", "Destroying the Control for Handle: " & $hDTP)
	$HandleBefore = $hDTP
	MsgBox($MB_SYSTEMMODAL, "Information", "Control Destroyed: " & _GUICtrlDTP_Destroy($hDTP) & @CRLF & _
			"Handel Before Destroy: " & $HandleBefore & @CRLF & _
			"Handle After Destroy: " & $hDTP)

	; Loop until user exits
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example