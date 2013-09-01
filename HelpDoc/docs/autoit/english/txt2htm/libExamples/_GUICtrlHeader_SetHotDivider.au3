#include <GUIConstantsEx.au3>
#include <GuiHeader.au3>

Example()

Func Example()
	Local $hGUI, $hHeader, $iIndex, $begin

	; Create GUI
	$hGUI = GUICreate("Header", 400, 300)
	$hHeader = _GUICtrlHeader_Create($hGUI)
	_GUICtrlHeader_SetUnicodeFormat($hHeader, True)
	GUISetState()

	; Add columns
	_GUICtrlHeader_AddItem($hHeader, "Column 1", 100)
	_GUICtrlHeader_AddItem($hHeader, "Column 2", 100)
	_GUICtrlHeader_AddItem($hHeader, "Column 3", 100)
	_GUICtrlHeader_AddItem($hHeader, "Column 4", 100)

	; Loop until user exits
	Do
		If TimerDiff($begin) > 500 Then
			$iIndex = Mod($iIndex + 1, 4)
			_GUICtrlHeader_SetHotDivider($hHeader, False, $iIndex)
			$begin = TimerInit()
		EndIf
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example
