#include <GuiComboBox.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Global $iMemo

Example()

Func Example()
	Local $aList, $hCombo
	Opt("GUIDataSeparatorChar", ",") ; set seperator char to char we want to use

	; Create GUI
	GUICreate("ComboBox Get List", 400, 296)
	$hCombo = GUICtrlCreateCombo("", 2, 2, 396, 296)
	$iMemo = GUICtrlCreateEdit("", 2, 32, 396, 266, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; Add files
	_GUICtrlComboBox_AddDir($hCombo, "", $DDL_DRIVES, False)

	; Get List
	$aList = StringSplit(_GUICtrlComboBox_GetList($hCombo), ",")
	For $x = 1 To $aList[0]
		MemoWrite($aList[$x])
	Next

	; Loop until user exits
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

; Write a line to the memo control
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
