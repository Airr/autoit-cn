#include <GUIConstantsEx.au3>

Example()

Func Example()
	Local $msg

	GUICreate("My GUI")  ; ����һ��������ʾ�� GUI ����

	GUISetState()       ; ��ʾһ���հ׵Ĵ���

	; ���н���,ֱ�����ڱ��ر�
	While 1
		$msg = GUIGetMsg()

		If $msg = $GUI_EVENT_CLOSE Then ExitLoop
	WEnd

	GUIDelete()	; ������ 1
EndFunc   ;==>Example