#include <GUIConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hGUI, $hStatus
	Local $aParts[3] = [75, 150, -1]

	; Create GUI
	$hGUI = GUICreate("StatusBar Show/Hide", 400, 300)

	;===============================================================================
	; defaults to 1 part, no text
	$hStatus = _GUICtrlStatusBar_Create($hGUI)
	;===============================================================================
	_GUICtrlStatusBar_SetParts($hStatus, $aParts)

	GUISetState()

	MsgBox($MB_SYSTEMMODAL, "Information", "Hide StatusBar")
	_GUICtrlStatusBar_ShowHide($hStatus, @SW_HIDE)
	MsgBox($MB_SYSTEMMODAL, "Information", "Show StatusBar")
	_GUICtrlStatusBar_ShowHide($hStatus, @SW_SHOW)

	; Loop until user exits
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
