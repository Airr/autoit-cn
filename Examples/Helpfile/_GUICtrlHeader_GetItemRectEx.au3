#include <GUIConstantsEx.au3>
#include <GuiHeader.au3>

$Debug_HDR = False ; ��鴫�ݸ�����������, ����ΪTrue�������һ���ؼ��ľ��,���ڼ�����Ƿ���

Global $iMemo

_Main()

Func _Main()
	Local $hGUI, $hHeader, $tRect

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

	; Show column 1 rectangle
	$tRect = _GUICtrlHeader_GetItemRectEx($hHeader, 0)
	MemoWrite("Column 1 left .: " & DllStructGetData($tRect, "Left"))
	MemoWrite("Column 1 top ..: " & DllStructGetData($tRect, "Top"))
	MemoWrite("Column 1 right : " & DllStructGetData($tRect, "Right"))
	MemoWrite("Column 1 bottom: " & DllStructGetData($tRect, "Bottom"))


	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>_Main

; д��һ�е� memo �ؼ�
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
