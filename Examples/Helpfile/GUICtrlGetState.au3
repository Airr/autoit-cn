#include <GUIConstantsEx.au3>

Example()

Func Example()
	Local $n, $msg

	GUICreate("My GUI (GetControlState)")
	$n = GUICtrlCreateCheckbox("checkbox", 10, 10)
	GUICtrlSetState(-1, 1) 	; ����ָ���ؼ���״̬

	GUISetState()       ; ��ʾһ���հ׵Ĵ���

	; ���н���,ֱ�����ڱ��ر�
	While 1
		$msg = GUIGetMsg()

		If $msg = $GUI_EVENT_CLOSE Then ExitLoop
	WEnd

	MsgBox(4096, "״̬", StringFormat("GUICtrlRead=%d\nGUICtrlGetState=%d", GUICtrlRead($n), GUICtrlGetState($n)))
EndFunc   ;==>Example