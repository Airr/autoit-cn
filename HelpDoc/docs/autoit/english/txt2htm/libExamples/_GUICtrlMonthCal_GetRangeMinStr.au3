#include <GUIConstantsEx.au3>
#include <GuiMonthCal.au3>
#include <WindowsConstants.au3>

Global $iMemo

Example()

Func Example()
	Local $hMonthCal

	; Create GUI
	GUICreate("Month Calendar Get Range Min String", 400, 300)
	$hMonthCal = GUICtrlCreateMonthCal("", 4, 4, -1, -1, BitOR($WS_BORDER, $MCS_MULTISELECT), 0x00000000)

	; Create memo control
	$iMemo = GUICtrlCreateEdit("", 4, 168, 392, 128, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; Get range
	_GUICtrlMonthCal_SetRange($hMonthCal, @YEAR, 1, 1, @YEAR, 12, 31)
	MemoWrite("Minimum selectable date: " & _GUICtrlMonthCal_GetRangeMinStr($hMonthCal))
	MemoWrite("Maximum selectable date: " & _GUICtrlMonthCal_GetRangeMaxStr($hMonthCal))

	; Loop until user exits
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

; Write message to memo
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
