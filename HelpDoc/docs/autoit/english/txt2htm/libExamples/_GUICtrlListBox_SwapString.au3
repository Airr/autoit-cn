#include <GUIConstantsEx.au3>
#include <GuiListBox.au3>
#include <MsgBoxConstants.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	Local $sText, $hListBox

	; Create GUI
	GUICreate("List Box Swap String", 400, 296)
	$hListBox = GUICtrlCreateList("", 2, 2, 396, 296, BitOR($WS_BORDER, $WS_VSCROLL, $LBS_NOTIFY, $LBS_MULTIPLESEL))
	GUISetState(@SW_SHOW)

	; Add strings
	_GUICtrlListBox_BeginUpdate($hListBox)
	For $iI = 1 To 9
		$sText = StringFormat("%03d : Random string ", Random(1, 100, 1))
		For $iX = 1 To Random(1, 20, 1)
			$sText &= Chr(Random(65, 90, 1))
		Next
		_GUICtrlListBox_AddString($hListBox, $sText)
	Next
	_GUICtrlListBox_EndUpdate($hListBox)

	; swap the strings
	MsgBox($MB_SYSTEMMODAL, "Information", "Swapping Strings (3:5)")
	_GUICtrlListBox_SwapString($hListBox, 3, 5)

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
