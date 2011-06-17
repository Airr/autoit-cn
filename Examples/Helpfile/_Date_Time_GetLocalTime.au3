#include <GuiConstantsEx.au3>
#include <Date.au3>
#include <WindowsConstants.au3>

; ����ϵͳ��ȫ���� Vista �� Windows API "SetLocalime" ���ܱ��ܾ�

Global $iMemo

_Main()

Func _Main()
	Local $tCur, $tNew

	; ���� GUI
	GUICreate("Time", 400, 300)
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 296, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; ��ʾ��ǰ�ı���ʱ��
	$tCur = _Date_Time_GetLocalTime()
	MemoWrite("Current date/time .: " & _Date_Time_SystemTimeToDateTimeStr($tCur))

	; �����µı���ʱ��
	$tNew = _Date_Time_EncodeSystemTime(8, 19, @YEAR, 3, 10, 45)
	If Not _Date_Time_SetLocalTime(DllStructGetPtr($tNew)) Then
		MsgBox(4096, "Error", "System clock cannot be SET" & @CRLF & @CRLF & _WinAPI_GetLastErrorMessage())
		Exit
	EndIf
	$tNew = _Date_Time_GetLocalTime()
	MemoWrite("New date/time .....: " & _Date_Time_SystemTimeToDateTimeStr($tNew))

	; ���豾��ʱ��
	_Date_Time_SetLocalTime(DllStructGetPtr($tCur))

	; ��ʾ��ǰ�ı���ʱ��
	$tCur = _Date_Time_GetLocalTime()
	MemoWrite("Current date/time .: " & _Date_Time_SystemTimeToDateTimeStr($tCur))

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

EndFunc   ;==>_Main

; д��һ�е� memo �ؼ�
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
