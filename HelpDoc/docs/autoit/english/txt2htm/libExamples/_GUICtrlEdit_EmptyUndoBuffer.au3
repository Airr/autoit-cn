#include <GuiEdit.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hEdit

	; Create GUI
	GUICreate("Edit Empty Undo Buffer", 400, 300)
	$hEdit = GUICtrlCreateEdit("This is a test" & @CRLF & "Another Line", 2, 2, 394, 268)
	GUISetState()

	_GUICtrlEdit_AppendText($hEdit, @CRLF & "Append to the end?")

	MsgBox($MB_SYSTEMMODAL, "Information", "Can Undo: " & _GUICtrlEdit_CanUndo($hEdit))

	_GUICtrlEdit_EmptyUndoBuffer($hEdit)

	MsgBox($MB_SYSTEMMODAL, "Information", "Can Undo: " & _GUICtrlEdit_CanUndo($hEdit))

	; Loop until user exits
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
