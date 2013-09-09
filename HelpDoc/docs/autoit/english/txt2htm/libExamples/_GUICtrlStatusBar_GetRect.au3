#include <GUIConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <WindowsConstants.au3>

Global $iMemo

Example()

Func Example()
	Local $hGUI, $aRect, $hStatus
	Local $aParts[3] = [75, 150, -1]

	; Create GUI
	$hGUI = GUICreate("StatusBar Get Rect", 400, 300)
	$hStatus = _GUICtrlStatusBar_Create($hGUI)

	; Create memo control
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 274, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; Set/Get parts
	_GUICtrlStatusBar_SetParts($hStatus, $aParts)

	; Get part 1 rectangles
	$aRect = _GUICtrlStatusBar_GetRect($hStatus, 0)
	MemoWrite("Part 1 left ...: " & $aRect[0])
	MemoWrite("Part 1 top ....: " & $aRect[1])
	MemoWrite("Part 1 right ..: " & $aRect[2])
	MemoWrite("Part 1 bottom .: " & $aRect[3])

	; Loop until user exits
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

; Write message to memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
