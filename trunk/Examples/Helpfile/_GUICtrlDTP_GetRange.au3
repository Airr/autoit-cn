#include <GUIConstantsEx.au3>
#include <GuiDateTimePicker.au3>

$Debug_DTP = False ��鴫�ݸ� DTP ����������, ����ΪTrue�������һ���ؼ��ľ��,���ڼ�����Ƿ���

Global $iMemo, $aRange[14] = [True, @YEAR, 1, 1, 21, 45, 32, True, @YEAR, 12, 31, 23, 59, 59]

_Main()

Func _Main()
	Local $hDTP

	; ���� GUI
	GUICreate("DateTimePick Get Range", 400, 300)
	$hDTP = GUICtrlGetHandle(GUICtrlCreateDate("", 2, 6, 190))
	$iMemo = GUICtrlCreateEdit("", 2, 32, 396, 266, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; ������ʾ�ĸ�ʽ
	_GUICtrlDTP_SetFormat($hDTP, "ddd MMM dd, yyyy hh:mm ttt")

	; �������ڷ�Χ
	_GUICtrlDTP_SetRange($hDTP, $aRange)

	; ��ʾ���ڷ�Χ
	$aRange = _GUICtrlDTP_GetRange($hDTP)
	MemoWrite("Minimum date: " & GetDateStr())
	MemoWrite("Maximum date: " & GetDateStr(7))
	MemoWrite("Minimum time: " & GetTimeStr(4))
	MemoWrite("Maximum time: " & GetTimeStr(11))

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

; �������ڲ���
Func GetDateStr($iOff = 0)
	Return StringFormat("%02d/%02d/%04d", $aRange[$iOff + 2], $aRange[$iOff + 3], $aRange[$iOff + 1])
EndFunc   ;==>GetDateStr

; ����ʱ�䲿��
Func GetTimeStr($iOff = 0)
	Return StringFormat("%02d:%02d:%02d", $aRange[$iOff], $aRange[$iOff + 1], $aRange[$iOff + 2])
EndFunc   ;==>GetTimeStr

; д��һ�е� memo �ؼ�
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
