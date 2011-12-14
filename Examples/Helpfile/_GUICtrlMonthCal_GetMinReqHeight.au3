#include <GUIConstantsEx.au3>
#include <GuiMonthCal.au3>
#include <WindowsConstants.au3>

$Debug_MC = False ; ��鴫�ݸ� MonthCal ����������, ����Ϊ True ��ʹ��ָ����һ�ؼ��ľ����������Ƿ���

Global $iMemo

_Main()

Func _Main()
	Local $hMonthCal

	; ���� GUI
	GUICreate("Month Calendar Get Min Req Height", 400, 300)
	$hMonthCal = GUICtrlCreateMonthCal("", 4, 4, -1, -1, BitOR($WS_BORDER, $MCS_MULTISELECT), 0x00000000)

	; ���� memo �ؼ�
	$iMemo = GUICtrlCreateEdit("", 4, 168, 392, 128, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; ��ȡ��Ҫ����С�߶�/���
	MemoWrite("Minimum required height: " & _GUICtrlMonthCal_GetMinReqHeight($hMonthCal))
	MemoWrite("Minimum required width : " & _GUICtrlMonthCal_GetMinReqWidth($hMonthCal))

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

; д����Ϣ�� memo
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
