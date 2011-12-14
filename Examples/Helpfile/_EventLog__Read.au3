#include <GUIConstantsEx.au3>
#include <EventLog.au3>

Global $iMemo

_Main()

Func _Main()
	Local $hEventLog, $aEvent

	; ���� GUI
	GUICreate("EventLog", 400, 300)
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 300, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; ��ȡ������¼���¼
	$hEventLog = _EventLog__Open("", "Application")
	$aEvent = _EventLog__Read($hEventLog, True, False) ; ��ȡ���һ���¼�
;~ 	$hEventLog = _EventLog__Open("", "System")
;~ 	$aEvent = _EventLog__Read($hEventLog)
;~ 	$aEvent = _EventLog__Read($hEventLog, True, False)
	MemoWrite("Result ............: " & $aEvent[0])
	MemoWrite("Record number .....: " & $aEvent[1])
	MemoWrite("Submitted .........: " & $aEvent[2] & " " & $aEvent[3])
	MemoWrite("Generated .........: " & $aEvent[4] & " " & $aEvent[5])
	MemoWrite("Event ID ..........: " & $aEvent[6])
	MemoWrite("Type ..............: " & $aEvent[8])
	MemoWrite("Category ..........: " & $aEvent[9])
	MemoWrite("Source ............: " & $aEvent[10])
	MemoWrite("Computer ..........: " & $aEvent[11])
	MemoWrite("Username ..........: " & $aEvent[12])
	MemoWrite("Description .......: " & $aEvent[13])
	_EventLog__Close($hEventLog)


	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

EndFunc   ;==>_Main

; д��һ�е� memo �ؼ�
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
