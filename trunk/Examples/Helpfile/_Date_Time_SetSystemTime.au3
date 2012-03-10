#include <GUIConstantsEx.au3>
#include <Date.au3>
#include <WindowsConstants.au3>

; ����ϵͳ��ȫ��,�� Vista �� Windows API "SetSystemTime" ���ܱ��ܾ�

Global $iMemo

_Main()

Func _Main()
	Local $tCur, $tNew

	; ���� GUI
	GUICreate("Time", 400, 300)
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 296, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; ��ȡ��ǰϵͳʱ��
	$tCur = _Date_Time_GetSystemTime()
	MemoWrite("Current system date/time .: " & _Date_Time_SystemTimeToDateTimeStr($tCur))

	; �����µ�ϵͳʱ��
	$tNew = _Date_Time_EncodeSystemTime(8, 19, @YEAR, 3, 10, 45)
	If Not _Date_Time_SetSystemTime(DllStructGetPtr($tNew)) Then
		MsgBox(4096, "����", "System clock cannot be SET" & @CRLF & @CRLF & _WinAPI_GetLastErrorMessage())
		Exit
	EndIf
	$tNew = _Date_Time_GetSystemTime()
	MemoWrite("New system date/time .....: " & _Date_Time_SystemTimeToDateTimeStr($tNew))

	; �ָ�ϵͳʱ��
	_Date_Time_SetSystemTime(DllStructGetPtr($tCur))

	; ��ȡ��ǰϵͳʱ��
	$tCur = _Date_Time_GetSystemTime()
	MemoWrite("Current system date/time .: " & _Date_Time_SystemTimeToDateTimeStr($tCur))

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

EndFunc   ;==>_Main

; д��һ�е� memo �ؼ�
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
