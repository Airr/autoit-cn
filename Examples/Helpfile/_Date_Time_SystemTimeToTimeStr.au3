
#include  <GuiConstantsEx.au3>
#include  <Date.au3>
#include  <WindowsConstants.au3>

Global $iMemo

_Main()

Func _Main()
	Local $hGUI, $tFile, $tSystem

	; ��������
	$hGUI = GUICreate("Time", 400, 300)
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 296, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; ��ȡϵͳʱ��
	$tSystem = _Date_Time_GetSystemTime()
	$tFile = _Date_Time_SystemTimeToFileTime( DllStructGetPtr($tSystem))
	MemoWrite("File time .:" & _Date_Time_FileTimeToStr($tFile))

	; ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

endfunc   ;==>_Main

; д��memo�ؼ�
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
endfunc   ;==>MemoWrite

