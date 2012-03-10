#include <GUIConstantsEx.au3>
#include <GuiHeader.au3>

$Debug_HDR = False ; ��鴫�ݸ�����������, ����ΪTrue�������һ���ؼ��ľ��,���ڼ�����Ƿ���

Global $iMemo

_Main()

Func _Main()
	Local $hGUI, $hHeader

	; ���� GUI
	$hGUI = GUICreate("Header", 400, 300)
	$hHeader = _GUICtrlHeader_Create($hGUI)
	$iMemo = GUICtrlCreateEdit("", 2, 24, 396, 274, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; Add columns
	_GUICtrlHeader_AddItem($hHeader, "Column 1", 100)
	_GUICtrlHeader_AddItem($hHeader, "Column 2", 100)
	_GUICtrlHeader_AddItem($hHeader, "Column 3", 100)
	_GUICtrlHeader_AddItem($hHeader, "Column 4", 100)

	; Show current bitmap margin
	MemoWrite("Current margin .: " & _GUICtrlHeader_GetBitmapMargin($hHeader))

	; Set new bitmap margin
	_GUICtrlHeader_SetBitmapMargin($hHeader, 8)

	; Show new bitmap margin
	MemoWrite("New margin .....: " & _GUICtrlHeader_GetBitmapMargin($hHeader))

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>_Main

; д��һ�е� memo �ؼ�
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
