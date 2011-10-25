
#include  <GuiConstantsEx.au3>
#include  <Date.au3>
#include  <WindowsConstants.au3>

Global $iMemo

_Main()

Func _Main()
	Local $hGUI, $tSystem

	; ��������
	$hGUI = GUICreate("Time", 400, 300)
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 296, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; ����ϵͳʱ��
	$tSystem = _Date_Time_EncodeSystemTime(@MON, @MDAY, @YEAR, @HOUR, @MIN, @SEC)
	MemoWrite("Current date/time .:" & _Date_Time_SystemTimeToDateTimeStr($tSystem))

	; ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

endfunc   ;==>_Main

; д��memo�ؼ�
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
endfunc   ;==>MemoWrite

