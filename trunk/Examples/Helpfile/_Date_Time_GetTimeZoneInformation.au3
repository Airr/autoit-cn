#include <GuiConstantsEx.au3>
#include <Date.au3>
#include <WindowsConstants.au3>

; ����ϵͳ��ȫ��,�� Vista �� Windows API "SetTimeZoneInformation" ���ܱ��ܾ�

Global $iMemo

_Main()

Func _Main()
	Local $aOld, $aNew

	; ���� GUI
	GUICreate("Time", 400, 300)
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 296, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; ��ʾ��ǰ��ʱ����Ϣ
	$aOld = _Date_Time_GetTimeZoneInformation()
	ShowTimeZoneInformation($aOld, "Current")

	; �����µ�ʱ����Ϣ
	If Not _Date_Time_SetTimeZoneInformation($aOld[1], "A3L CST", $aOld[3], $aOld[4], "A3L CDT", $aOld[6], $aOld[7]) Then
		MsgBox(4096, "Error", "System timezone cannot be SET" & @CRLF & @CRLF & _WinAPI_GetLastErrorMessage())
		Exit
	EndIf

	; ��ʾ�µ�ʱ����Ϣ
	$aNew = _Date_Time_GetTimeZoneInformation()
	ShowTimeZoneInformation($aNew, "New")

	; ����Ϊԭ����ʱ����Ϣ
	_Date_Time_SetTimeZoneInformation($aOld[1], $aOld[2], $aOld[3], $aOld[4], $aOld[5], $aOld[6], $aOld[7])

	; ��ʾ��ǰ��ʱ����Ϣ
	$aOld = _Date_Time_GetTimeZoneInformation()
	ShowTimeZoneInformation($aOld, "Reset")

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

EndFunc   ;==>_Main

; д��һ�е� memo �ؼ�
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite

; ��ʾʱ����Ϣ
Func ShowTimeZoneInformation(ByRef $aInfo, $comment)
	MemoWrite("******************* " & $comment & " *******************")
	MemoWrite("Result ............: " & $aInfo[0])
	MemoWrite("Current bias ......: " & $aInfo[1])
	MemoWrite("Standard name .....: " & $aInfo[2])
	MemoWrite("Standard date/time : " & _Date_Time_SystemTimeToDateTimeStr($aInfo[3]))
	MemoWrite("Standard bias......: " & $aInfo[4])
	MemoWrite("Daylight name .....: " & $aInfo[5])
	MemoWrite("Daylight date/time : " & _Date_Time_SystemTimeToDateTimeStr($aInfo[6]))
	MemoWrite("Daylight bias......: " & $aInfo[7])
EndFunc   ;==>ShowTimeZoneInformation
