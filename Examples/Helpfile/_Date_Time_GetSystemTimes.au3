#include <GUIConstantsEx.au3>
#include <Date.au3>
#include <WindowsConstants.au3>

Global $iMemo

_Main()

Func _Main()
	Local $aTime

	; ���� GUI
	GUICreate("Time", 400, 300)
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 296, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; ��ȡϵͳʱ��
	$aTime = _Date_Time_GetSystemTimes()

	MemoWrite("Idle time ...: " & _Date_Time_FileTimeToStr($aTime[0]))
	MemoWrite("System time .: " & _Date_Time_FileTimeToStr($aTime[1]))
	MemoWrite("User time ...: " & _Date_Time_FileTimeToStr($aTime[2]))

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

EndFunc   ;==>_Main

; д��һ�е� memo �ؼ�
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
