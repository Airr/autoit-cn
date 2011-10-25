#include <GuiConstantsEx.au3>
#include <WinApiEx.au3>
#include <WindowsConstants.au3>

Global $iMemo

_Main()

Func _Main()
	Local $hGUI, $aDisk

	; ��������
	$hGUI = GUICreate("Window Info", 400, 300)

	; ����memo�ؼ�
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 296, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; ��ȡ������Ϣ
	$tWINDOWINFO = _WinAPI_GetWindowInfo( _WinAPI_GetDesktopWindow())
	MemoWrite('Left:' & DllStructGetData($tWINDOWINFO, 'rWindow ', 1) & @CR)
	MemoWrite('Top:' & DllStructGetData($tWINDOWINFO, 'rWindow ', 2) & @CR)
	MemoWrite('Right:' & DllStructGetData($tWINDOWINFO, 'rWindow ', 3) & @CR)
	MemoWrite('Bottom:' & DllStructGetData($tWINDOWINFO, 'rWindow ', 4) & @CR)

	; ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
endfunc   ;==>_Main

; ��memo�ؼ�д����Ϣ
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
endfunc   ;==>MemoWrite

