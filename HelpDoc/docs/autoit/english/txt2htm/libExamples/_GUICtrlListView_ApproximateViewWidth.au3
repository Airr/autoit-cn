#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $iX, $hListView

	GUICreate("ListView Approximate View Width", 400, 300)
	$hListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Add column
	_GUICtrlListView_InsertColumn($hListView, 0, "Column 1", 100)

	; Add items
	For $iI = 0 To 9
		_GUICtrlListView_AddItem($hListView, "Row " & $iI)
	Next

	MsgBox($MB_SYSTEMMODAL, "Information", "Approximate View Width")
	; Resize view width
	$iX = _GUICtrlListView_ApproximateViewWidth($hListView)
	_WinAPI_SetWindowPos(GUICtrlGetHandle($hListView), 0, 2, 2, $iX, 268, $SWP_NOZORDER)

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
