#include <GuiConstantsEx.au3>
#include <ClipBoard.au3>
#include <WinAPI.au3>
#include <WindowsConstants.au3>

Global $iMemo

_Main()

Func _Main()
	Local $iFormat

	; ���� GUI
	GUICreate("Clipboard", 600, 400)
	$iMemo = GUICtrlCreateEdit("", 2, 2, 596, 396, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; Register a new clipboard format
	$iFormat = _ClipBoard_RegisterFormat("AutoIt Library Text")
	If $iFormat = 0 Then _WinAPI_ShowError("_ClipBoard_RegisterFormat failed")

	; ��ʾ�¸�ʽ
	MemoWrite(_ClipBoard_GetFormatName($iFormat))

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

EndFunc   ;==>_Main

; Write message to memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite