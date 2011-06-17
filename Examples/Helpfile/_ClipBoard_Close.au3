#include <GuiConstantsEx.au3>
#include <ClipBoard.au3>
#include <WinAPI.au3>
#include <WindowsConstants.au3>

Global $iMemo

_Main()

Func _Main()
	Local $hGUI

	; ���� GUI
	$hGUI = GUICreate("Clipboard", 600, 400)
	$iMemo = GUICtrlCreateEdit("", 2, 2, 596, 396, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; �򿪼�����
	If Not _ClipBoard_Open($hGUI) Then _WinAPI_ShowError("_ClipBoard_Open failed")

	; ��ʾ���õļ������ʽ
	MemoWrite("Clipboard formats ..: " & _ClipBoard_CountFormats())

	; ��ռ�����
	If Not _ClipBoard_Empty() Then _WinAPI_ShowError("_ClipBoard_Empty failed")

	; ��ʾ���õļ������ʽ
	MemoWrite("Clipboard formats ..: " & _ClipBoard_CountFormats())

	; �رռ�����
	_ClipBoard_Close()

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

EndFunc   ;==>_Main

; д����Ϣ�� memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite