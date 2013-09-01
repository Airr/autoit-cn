#include <GuiListBox.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $sItems, $aItems, $hListBox

	; Create GUI
	GUICreate("List Box Get Sel Items", 400, 296)
	$hListBox = GUICtrlCreateList("", 2, 2, 396, 296, BitOR($LBS_STANDARD, $LBS_EXTENDEDSEL))
	GUISetState()

	; Add strings
	_GUICtrlListBox_BeginUpdate($hListBox)
	For $iI = 1 To 9
		_GUICtrlListBox_AddString($hListBox, StringFormat("%03d : Random string", Random(1, 100, 1)))
	Next
	_GUICtrlListBox_EndUpdate($hListBox)

	; Select a few items
	_GUICtrlListBox_SetSel($hListBox, 3)
	_GUICtrlListBox_SetSel($hListBox, 4)
	_GUICtrlListBox_SetSel($hListBox, 5)

	; Get indexes of selected items
	$aItems = _GUICtrlListBox_GetSelItems($hListBox)
	For $iI = 1 To $aItems[0]
		If $iI > 1 Then $sItems &= ", "
		$sItems &= $aItems[$iI]
	Next
	MsgBox($MB_SYSTEMMODAL, "Information", "Items Selected: " & $sItems)

	; Loop until user exits
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
